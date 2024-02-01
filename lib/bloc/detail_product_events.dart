import 'package:test_project1/model/product_model.dart';

abstract class ProductDetailEvents {}

class ProductDetailLoading extends ProductDetailEvents {}

class ProductDetailLoaded extends ProductDetailEvents {
  late Products product;
  ProductDetailLoaded(this.product);
}

class ProductDetailNotLoaded extends ProductDetailEvents {}
