import 'package:flutter/material.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/cart_widget.dart';
import 'package:spare_ease/components/empty_cart.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});
  final bool isEmpty = false;

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return widget.isEmpty
        ? Scaffold(
            body: EmptyCartWidget(
                imagePath: AssetsManager.shoppingBasket,
                title: "Whoops",
                subtitle: "Looks like your cart is empty.",
                buttonText: "Shop Now"),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amberAccent,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AssetsManager.shoppingCart,
                ),
              ),
              title: Text("Cart"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_forever_rounded),
                )
              ],
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                CartWidget();
              },
            ),
          );
  }
}
