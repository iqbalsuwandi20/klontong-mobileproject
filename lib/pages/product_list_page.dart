import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../products/product_bloc.dart';
import '../products/product_event.dart';
import '../products/product_state.dart';
import 'product_detail_page.dart';
import 'product_form_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger to fetch products initially
    context.read<ProductBloc>().add(FetchProducts());

    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          // Check if state is updated after adding or deleting product
          if (state is ProductLoaded) {
            // Optionally perform actions or show messages here
          } else if (state is ProductError) {
            // Handle error state here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.nama ?? 'No Name'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      ).then((result) {
                        // Fetch ulang jika ada produk yang dihapus (result == true)
                        if (result == true) {
                          context.read<ProductBloc>().add(FetchProducts());
                        }
                      });
                    },
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No products found.'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormPage()),
          ).then((_) {
            context.read<ProductBloc>().add(FetchProducts());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
