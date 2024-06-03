import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:flutter_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 20,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Cart Page"),
      ),
      body: cart.isEmpty
          ? Center(child: Text(" Your Cart is Empty....."))
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          //get individual item in the cart
                          final item = cart[index];

                          return ListTile(
                            leading: Image.asset(item.imagePath),
                            title: Text(item.name),
                            subtitle: Text(item.price.toStringAsFixed(2)),
                            trailing: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                            ),
                          );
                        }))
              ],
            ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  //removing the product from cart
  removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                "Remove the Item from your Cart ?",
              ),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //add to cart
                    context.read<Shop>().removeFromCart(product, context);
                  },
                  child: Text("Yes"),
                )
              ],
            ));
  }
}
