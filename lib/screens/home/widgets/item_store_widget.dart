import 'package:flutter/material.dart';
import 'package:store/models/products_model.dart';
import 'package:store/screens/updata/update_product_page.dart';

class ItemStoreWidget extends StatelessWidget {
  const ItemStoreWidget({super.key, required this.productsModels});

  final ProductsModel productsModels;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdataProductPage.idPage,
          arguments: productsModels,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,

        children: [
          Container(
            width: 220,
            height: 130,

            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(150),

                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(height: 50),
                  Text(
                    productsModels.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${productsModels.price}'),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 32,

            child: Image.network(height: 90, width: 90, productsModels.image),
          ),
        ],
      ),
    );
  }
}
