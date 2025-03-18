import 'package:store/helper/api.dart';

Future<List<dynamic>> allCategoriesService() async {
  // ignore: missing_required_param
  List<dynamic> data = await Api().get(
    url: 'https://fakestoreapi.com/products/categories',
  );

  return data;
}
