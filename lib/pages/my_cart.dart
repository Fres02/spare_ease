import 'package:flutter/material.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/bottom_checkout.dart';
import 'package:spare_ease/components/cart_widget.dart';
import 'package:spare_ease/components/empty_cart.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});
  final bool isEmpty = false;

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
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
            bottomSheet: CartBottomSheetWidget(),
            appBar: AppBar(
              backgroundColor: Colors.amberAccent,
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AssetsManager.shoppingCart,
                ),
              ),
              title: Text(
                "Cart",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                )
              ],
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartWidget();
              },
            ),
          );
  }
}
