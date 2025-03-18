// import 'dart:developer';

// import 'package:store/helper/api.dart';
// import 'package:store/models/products_model.dart';

// class AllProductsServices {
//   Future<List<ProductsModel>> getAllProducts() async {
//     // ignore: missing_required_param
//     List<dynamic> data = await Api().get(
//       url: 'https://fakestoreapi.com/products',
//     );

//     List<ProductsModel> exportList = [];

//     for (int i = 0; i < data.length; i++) {
//       exportList.add(ProductsModel.fromJson(data[i]));

//     }
//     print('0000000000000000000000000000000');
//     log('$data');

//     return exportList;

//   }
// }

import 'dart:developer';

import 'package:store/helper/api.dart';
import 'package:store/models/products_model.dart';

class AllProductsServices {
  Future<List<ProductsModel>> getAllProducts() async {
    try {
      // ignore: missing_required_param
      List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products',
      );
      log(data.toString());

      if (data == null || data.isEmpty) {
        print('No data received or data is empty');
        return [];
      }

      List<ProductsModel> exportList = [];

      for (int i = 0; i < data.length; i++) {
        exportList.add(ProductsModel.fromJson(data[i]));
      }

      log('Received Data: $data');
      return exportList;
    } catch (e) {
      print('Error fetching data: $e');

      return [];
    }
  }
}
