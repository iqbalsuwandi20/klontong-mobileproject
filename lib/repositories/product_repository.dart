import '../models/klontong_model.dart';

class ProductRepository {
  final List<KlontongModel> _products = [];

  // Simulasi fetch produk
  Future<List<KlontongModel>> fetchProducts() async {
    // Simulasi delay
    await Future.delayed(const Duration(seconds: 1));
    return _products;
  }

  // Simulasi add produk
  Future<void> addProduct(KlontongModel product) async {
    try {
      // Simulasi delay
      await Future.delayed(const Duration(seconds: 1));
      print('Adding product: ${product.nama}'); // Debugging
      _products.add(product);
    } catch (e) {
      print('Error adding product: $e'); // Debugging
      throw Exception('Failed to add product: $e');
    }
  }

  // Simulasi delete produk
  Future<void> deleteProduct(int id) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _products
          .removeWhere((product) => product.id == id); // Hapus berdasarkan id
      print('Product with id $id deleted'); // Debugging
    } catch (e) {
      print('Error deleting product: $e'); // Debugging
      throw Exception('Failed to delete product: $e');
    }
  }
}
