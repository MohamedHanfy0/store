// class ProductsModel {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String category;
//   final String image;
//   final RatingModel ratingModel;

//   ProductsModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.ratingModel,
//   });

//   factory ProductsModel.fromJson(jsonData) {
//     return ProductsModel(
//       id: jsonData['id'],
//       title: jsonData['title'],
//       price: jsonData['price'],
//       description: jsonData['description'],
//       category: jsonData['category'],
//       image: jsonData['image'],
//       ratingModel: RatingModel.formJson(jsonData['rating']),
//     );
//   }
// }

// class RatingModel {
//   final double rate;
//   final int count;

//   RatingModel({required this.rate, required this.count});
//   factory RatingModel.formJson(jsonData) {
//     return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
//   }
// }


class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductsModel.fromJson(dynamic jsonData) {
    print('type rating ${jsonData["rating"].runtimeType}');
    
    double price;
    if (jsonData['price'] is int) {
      price = (jsonData['price'] as int).toDouble();
    } else if (jsonData['price'] is String) {
      price = double.parse(jsonData['price']);
    } else {
      price = jsonData['price'];
    }
    
    return ProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: price,
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      
      ratingModel: RatingModel.formJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.formJson(Map<String, dynamic> jsonData) {
    
    return RatingModel(
      rate:
          (jsonData['rate'] is int)
              ? (jsonData['rate'] as int).toDouble()
              : jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
