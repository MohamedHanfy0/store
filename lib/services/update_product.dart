import 'package:store/helper/api.dart';
import 'package:store/models/update_model.dart';

class UpdateProductService {
  Future<UpdateModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
    required int id,
    
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
       
      },
    );

    return UpdateModel.fromJson(data);
  }
}
