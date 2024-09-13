import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/product_list_page.dart';
import 'pages/product_form_page.dart';
import 'products/product_bloc.dart';
import 'repositories/product_repository.dart';

void main() {
  final productRepository = ProductRepository();

  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  const MyApp({
    super.key,
    required this.productRepository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository),
      child: MaterialApp(
        title: 'Klontong',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const ProductListPage(),
          '/addProduct': (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
