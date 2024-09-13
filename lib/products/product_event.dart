import '../models/klontong_model.dart';

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

class FetchProduct extends ProductEvent {
  final int id;
  FetchProduct(this.id);
}

class AddProduct extends ProductEvent {
  final KlontongModel product;
  AddProduct(this.product);
}

class UpdateProduct extends ProductEvent {
  final KlontongModel product;
  UpdateProduct(this.product);
}

class DeleteProduct extends ProductEvent {
  final int id;
  DeleteProduct(this.id);
}
