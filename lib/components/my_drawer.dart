import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/my_listtile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //Drawer header logo
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 72,
              )),

              const SizedBox(
                height: 45,
              ),
              //listtile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          MyListTile(
            text: "Exit",
            icon: Icons.exit_to_app,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
