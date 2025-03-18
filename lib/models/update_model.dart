class UpdateModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  UpdateModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory UpdateModel.fromJson(dynamic jsonData) {
    

    double price;
    if (jsonData['price'] is int) {
      price = (jsonData['price'] as int).toDouble();
    } else if (jsonData['price'] is String) {
      price = double.parse(jsonData['price']);
    } else {
      price = jsonData['price'];
    }

    return UpdateModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: price,
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
    );
  }
}
