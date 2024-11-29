import 'package:flutter/material.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/empty_cart.dart';
import 'package:spare_ease/components/placed_orders_widget.dart';
import 'package:spare_ease/components/title_text.dart';

class PlacedOrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const PlacedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PlacedOrdersScreen> createState() => _PlacedOrdersScreenState();
}

class _PlacedOrdersScreenState extends State<PlacedOrdersScreen> {
  bool isEmptyOrders = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          backgroundColor: Colors.amberAccent,
          title: Text(
            "Placed Orders",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: isEmptyOrders
            ? EmptyCartWidget(
                imagePath: AssetsManager.orderBag,
                title: "No orders yet",
                subtitle: "Hurry up and place an order",
                buttonText: "Shop now")
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersWidgetFree(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                      // thickness: 8,
                      // color: Colors.red,
                      );
                },
              ));
  }
}
