import 'package:store/helper/api.dart';
import 'package:store/models/products_models.dart';

class CategoriesService {
  Future<List<ProductsModels>> categoriesProducts({
    required String categoryName,
  }) async {

    List<ProductsModels> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductsModels> exportList = [];
    for (int i = 0; i < data.length; i++) {
      exportList.add(ProductsModels.fromJson(data[i]));
    }
    return exportList;
  }
}

