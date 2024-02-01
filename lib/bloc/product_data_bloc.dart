import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_project1/bloc/product_data_events.dart';
import 'package:test_project1/model/product_model.dart';

import '../apis/rest_client.dart';
import '../apis/urls.dart';
import 'detail_product_events.dart';

class ProductDataBloc {
  BehaviorSubject<ProductsDataEvents> productsDataEvents = BehaviorSubject();
  BehaviorSubject<ProductDetailEvents> productDetailEvents = BehaviorSubject();
  final RestClient _restClient = RestClient();

  Future<void> loadProductData() async {
    try {
      productsDataEvents.add(ProductsDataLoading());
      Response response =
          await _restClient.getRequest(ManageUrls().productListUrl);
      List<Products> productList =
          List<Products>.from(response.data.map((e) => Products.fromMap(e)));
      productsDataEvents.add(ProductsDataLoaded(productList));
    } catch (error) {
      print(error);
    }
  }

  Future<void> loadSingleProduct({required String id}) async {
    try {
      productDetailEvents.add(ProductDetailLoading());
      Response response =
          await _restClient.getRequest("${ManageUrls().productListUrl}/$id");
      print(response.data);
      Products product = Products.fromMap(response.data);
      productDetailEvents.add(ProductDetailLoaded(product));
    } catch (err) {
      print(err);
    }
  }
}
