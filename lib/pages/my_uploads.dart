import 'package:flutter/material.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/empty_cart.dart';
import 'package:spare_ease/components/placed_orders_widget.dart';
import 'package:spare_ease/components/title_text.dart';

class UploadedProductsScreen extends StatefulWidget {
  static const routeName = '/UploadedProductsScreen';

  const UploadedProductsScreen({Key? key}) : super(key: key);

  @override
  State<UploadedProductsScreen> createState() => _UploadedProductsScreenState();
}

class _UploadedProductsScreenState extends State<UploadedProductsScreen> {
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
          "Products Uploaded",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: isEmptyOrders
          ? EmptyCartWidget(
              imagePath: AssetsManager.upload,
              title: "No Uploads Yet",
              subtitle: "Show us what you wanna sell",
              buttonText: "Upload now")
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
            ),
    );
  }
}
