import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products.dart';
import 'package:flutter_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  //add to cart button
  void addToCart(BuildContext context) {
//show a dialog box to confirm whether the user wants to keep the product in cart

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text(
                "Add this Item to your Cart ?",
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
                    context.read<Shop>().addToCart(product, context);
                  },
                  child: Text("Add"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).colorScheme.secondary),
                    child: Image.asset(product.imagePath)),
              ),
              const SizedBox(
                height: 25,
              ),
              //product name
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),

              const SizedBox(
                height: 25,
              ),
            ],
          ),
          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //product price
              Text(
                product.price.toStringAsFixed(2),
                style: TextStyle(fontSize: 20),
              ),

              //add to cart button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)),
              )
            ],
          )
        ],
      ),
    );
  }
}
