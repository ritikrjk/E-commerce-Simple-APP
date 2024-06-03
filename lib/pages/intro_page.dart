import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(
            Icons.shopping_bag_outlined,
            size: 72,
          ),
          //title
          Text(
            "MinMall Shop",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          //subtitle
          Text(
            "Premium Quality products assured",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          //button
          MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: Icon(Icons.arrow_forward))
        ]),
      ),
    );
  }
}
