import 'package:flutter/material.dart';
import 'package:liquar_hub/models/liquar_model.dart';
import 'package:liquar_hub/service/api_service.dart';


import '../auth/model/user_model.dart';

class ProductProvider extends ChangeNotifier {
  final ProductApiService apiservice = ProductApiService();
  List<UserModel> products = [];

  Future<void> fetchProducts() async {
    try {
      List<UserModel> fetchedProducts = (await ProductApiService.fetchProducts()).cast<UserModel>();
      products = fetchedProducts;
      notifyListeners(); // Notify listeners when data changes
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  Future<void> addProduct(UserModel product) async {
    try {
      await ProductApiService.addProduct(product as LiquarModel);
      await fetchProducts();
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await ProductApiService.deleteProduct(productId);
      await fetchProducts();
    } catch (e) {
      print('Error deleting product: $e');
    }
  }
}