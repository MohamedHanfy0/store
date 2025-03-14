import 'dart:convert';

import 'package:store/models/products_models.dart';
import 'package:http/http.dart' as http;

Future<List<ProductsModels>> getAllProducts() async {
  http.Response response = await http.get(
    Uri.parse('https://fakestoreapi.com/products'),
  );

  List<dynamic> data = jsonDecode(response.body);
  List<ProductsModels> exportList = [];
  for (int i = 0; i < data.length; i++) {
    exportList.add(ProductsModels.fromJson(data[i]));
  }
  return exportList;
}
