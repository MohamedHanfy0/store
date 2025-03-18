import 'package:store/helper/api.dart';
import 'package:store/models/products_model.dart';

class CategoriesService {
  Future<List<ProductsModel>> categoriesProducts({
    required String categoryName,
  }) async {
    // ignore: missing_required_param
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductsModel> exportList = [];
    for (int i = 0; i < data.length; i++) {
      exportList.add(ProductsModel.fromJson(data[i]));
    }
    return exportList;
  }
}
