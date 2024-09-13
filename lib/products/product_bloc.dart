import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/product_repository.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    // Register handler for FetchProducts event
    on<FetchProducts>(_onFetchProducts);
    // Register handler for AddProduct event
    on<AddProduct>(_onAddProduct);
    // Register handler for DeleteProduct event
    on<DeleteProduct>(_onDeleteProduct); // <-- Tambahkan ini
  }

  // Handler for FetchProducts event
  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.fetchProducts();
      print('Products loaded: ${products.length} items'); // Debugging
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products: $e'));
    }
  }

  // Handler for AddProduct event
  Future<void> _onAddProduct(
      AddProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await productRepository.addProduct(event.product);
      print('Product added successfully'); // Debugging
      add(FetchProducts()); // Trigger FetchProducts after adding product
    } catch (e) {
      print('Error in adding product: $e'); // Debugging
      emit(ProductError('Failed to add product: $e'));
    }
  }

  // Handler for DeleteProduct event
  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      await productRepository.deleteProduct(event.id); // Panggil deleteProduct
      print('Product deleted successfully'); // Debugging
      add(FetchProducts()); // Fetch ulang daftar produk setelah dihapus
    } catch (e) {
      print('Error in deleting product: $e'); // Debugging
      emit(ProductError('Failed to delete product: $e'));
    }
  }
}
