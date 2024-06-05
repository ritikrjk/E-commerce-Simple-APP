import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/shop.dart';
import 'package:flutter_ecommerce/pages/cart_page.dart';
import 'package:flutter_ecommerce/pages/intro_page.dart';
import 'package:flutter_ecommerce/pages/shop_page.dart';
import 'package:flutter_ecommerce/themes/light_mode.dart';
import 'package:provider/provider.dart';
//to check something
void main() {
  runApp(ChangeNotifierProvider
  
  (create: (BuildContext context)=> Shop(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage()
      },
    );
  }
}
