import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/klontong_model.dart';
import '../products/product_bloc.dart';
import '../products/product_event.dart';

class ProductDetailPage extends StatelessWidget {
  final KlontongModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nama ?? 'No Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SKU: ${product.sku ?? 'N/A'}'),
            Text('Nama: ${product.nama ?? 'N/A'}'),
            ElevatedButton(
              onPressed: () {
                context.read<ProductBloc>().add(DeleteProduct(product.id ?? 0));
                Navigator.pop(
                    context, true); // Kembalikan nilai true setelah delete
              },
              child: const Text('Delete Product'),
            ),
          ],
        ),
      ),
    );
  }
}
