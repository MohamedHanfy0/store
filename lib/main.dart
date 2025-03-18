import 'package:flutter/material.dart';
import 'package:store/screens/home/home_page.dart';
import 'package:store/screens/updata/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdataProductPage.idPage: (context) => UpdataProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
