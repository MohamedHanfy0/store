import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/products_model.dart';
import 'package:store/screens/home/widgets/item_store_widget.dart';
import 'package:store/screens/updata/update_product_page.dart';
import 'package:store/services/all_products_services.dart';

class HomePage extends StatelessWidget {
  static const id = 'homePage';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 30),
        centerTitle: true,
        title: Text('New Trend'),
        actions: [Icon(FontAwesomeIcons.cartPlus)],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductsModel>>(
          future: AllProductsServices().getAllProducts(),

          builder: (context, snapshot) {
           
            // List<ProductsModels> getData = snapshot.data;
            if (snapshot.hasData) {


              //  print('this ================== ${snapshot.data}');
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  return ItemStoreWidget(productsModels: snapshot.data![index]);
                  // return Text('hello');
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
