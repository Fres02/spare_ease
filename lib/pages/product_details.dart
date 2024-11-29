import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:spare_ease/components/app_constants.dart';
import 'package:spare_ease/components/app_name_text.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const routeName = "/ProductDetailsScreen";
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        centerTitle: true,
        title: const AppNameTextWidget(
          fontSize: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: AppConstants.imageUrl,
              height: size.height * 0.22,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text("Title" * 18,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    flex: 1,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "LKR",
                            style: TextStyle(
                              fontSize: 10, // Smaller font size
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                                width: 2), // Space between "LKR" and the value
                          ),
                          TextSpan(
                            text: "1550.00",
                            style: TextStyle(
                              fontSize: 16, // Regular font size
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitlesTextWidget(label: "About this item"),
                  SubtitleTextWidget(label: "In Phone")
                ],
              ),
            ),
            const SizedBox(height: 15),
            SubtitleTextWidget(label: "Description" * 15),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(75, 62, 53, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                elevation: 5,
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
