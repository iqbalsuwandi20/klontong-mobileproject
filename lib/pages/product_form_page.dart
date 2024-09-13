import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/klontong_model.dart';
import '../products/product_bloc.dart';
import '../products/product_event.dart';

class ProductFormPage extends StatelessWidget {
  const ProductFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _namaController = TextEditingController();
    final _skuController = TextEditingController();
    final _deskripsiController = TextEditingController();
    final _hargaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skuController,
                decoration: const InputDecoration(labelText: 'SKU'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter SKU';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final product = KlontongModel(
                      nama: _namaController.text,
                      sku: _skuController.text,
                      deskripsi: _deskripsiController.text,
                      harga: int.tryParse(_hargaController.text),
                    );
                    context.read<ProductBloc>().add(AddProduct(product));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
