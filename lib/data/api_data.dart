import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/screens/models/home_products.dart';
Future<List> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
 
    List products =
        data.map((item) => ProductDataModel.fromJson(item)).toList();

    return products;
  } else {
    throw Exception('Failed to load data');
  }
}