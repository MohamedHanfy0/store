
import 'package:store/helper/api.dart';
import 'package:store/models/products_models.dart';

Future<List<ProductsModels>> getAllProductsService() async {
  

  List<dynamic> data = await Api().get(
    url: 'https://fakestoreapi.com/products',
  );
  List<ProductsModels> exportList = [];
  for (int i = 0; i < data.length; i++) {
    exportList.add(ProductsModels.fromJson(data[i]));
  }
  return exportList;
}
