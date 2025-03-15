import 'package:http/http.dart' as http;
import 'package:store/helper/api.dart';
import 'package:store/models/products_models.dart';

Future<ProductsModels> addProduct({
  required String title,
  required String price,
  required String description,
  required String image,
  required String category,
}) async {
  Map<String, dynamic> data = await Api().post(
    url: 'https://fakestoreapi.com/products',
    body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    },
  );

  return ProductsModels.fromJson(data);
}
