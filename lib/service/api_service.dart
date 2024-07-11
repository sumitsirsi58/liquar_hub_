import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/liquar_model.dart';
import 'api_endpoint.dart';

class ApiService {
  static Future<List<LiquarModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => LiquarModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<LiquarModel>> fetchProduct() async {
    Uri uri = Uri.parse(ApiEndpoints.product);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String body = response.body;
      List<Map<String, dynamic>> listMap = jsonDecode(body);
      List<LiquarModel> productList = [];
      for (int i = 0; i < listMap.length; i++) {
        LiquarModel productModel = LiquarModel.fromJson(listMap[i]);
        productList.add(productModel);
      }

      return productList;
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<String> addProduct(LiquarModel liquarModel) async {
    Uri uri = Uri.parse(ApiEndpoints.product);
    Map<String, dynamic> map = liquarModel.toJson();
    String mapStr = jsonEncode(map);
    Response response = await http.post(uri, body: mapStr);
    if (response.statusCode == 201) {
      return 'Product added successfully';
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<String> updateProduct(
      String productId, LiquarModel productModel) async {
    Map<String, dynamic> map = productModel.toJson();
    String mapStr = jsonEncode(map);
    Uri uri = Uri.parse('${ApiEndpoints.product}/$productId');
    Response response = await http.put(uri, body: mapStr);
    if (response.statusCode == 200) {
      return 'Product updated successfully';
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<LiquarModel> deleteProduct(String id) async {
    String url = '${ApiEndpoints.product}/$id';
    Uri uri = Uri.parse(url);
    Response response = await http.delete(uri);
    String body = response.body;
    var json = jsonDecode(body);
    LiquarModel productModel =
    LiquarModel.fromJson(json);
    return productModel;
  }
}
