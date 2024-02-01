import 'package:test_project1/model/product_model.dart';

abstract class ProductsDataEvents {}

class ProductsDataLoading extends ProductsDataEvents {}

class ProductsDataLoaded extends ProductsDataEvents {
  late List<Products> products;
  ProductsDataLoaded(this.products);
}

class ProductsDataNotLoaded extends ProductsDataEvents {}
