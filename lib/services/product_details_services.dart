import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_details_model.dart';

class ProductService {
  final String _url = "https://dummyjson.com/products";

  Future<ProductsDetails> fetchProducts() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return ProductsDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
