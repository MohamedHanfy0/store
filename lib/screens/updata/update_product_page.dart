import 'package:flutter/material.dart';
import 'package:store/models/products_model.dart';
import 'package:store/screens/updata/widgets/custom_text_field.dart';
import 'package:store/services/update_product.dart';

class UpdataProductPage extends StatelessWidget {
  static String idPage = 'updataProduct';

  String? productName, image, descripation, price;

  int? id;

  @override
  Widget build(BuildContext context) {
    ProductsModel productsModels =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      appBar: AppBar(title: Text("Updata Product"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            CustomTextFieldWidget(
              hintText: 'Product Name',
              onChanged: (valueName) {
                productName = valueName;
              },
            ),
            CustomTextFieldWidget(
              hintText: 'price',
              textInputType: TextInputType.number,
              onChanged: (valuePrice) {
                price = valuePrice;
              },
            ),
            CustomTextFieldWidget(
              hintText: 'Descriptation',
              onChanged: (valueDes) {
                descripation = valueDes;
              },
            ),
            CustomTextFieldWidget(
              hintText: 'Image',
              onChanged: (valueImage) {
                image = valueImage;
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () {
                  productName == null
                      ? productName = productsModels.title
                      // ignore: avoid_print
                      : print('title == ok');
                  price == null
                      ? price = productsModels.price.toString()
                      // ignore: avoid_print
                      : print('price == ok');
                  descripation == null
                      ? descripation = productsModels.description
                      // ignore: avoid_print
                      : print(' des == ok');
                  image == null
                      ? image = productsModels.image
                      // ignore: avoid_print
                      : print('image == ok');

                  try {
                    updateProduct(productsModels);
                    // ignore: avoid_print
                    print("success............");
                  } catch (e) {
                    // ignore: avoid_print
                    print('Error......... $e');
                  }
                },
                child: Text("update", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateProduct(ProductsModel productsModels) {
    UpdateProductService().updateProduct(
      title: productName!,
      price: price!,
      description: descripation!,
      image: image!,
      category: productsModels.category,
      id: productsModels.id,
    );
  }
}
