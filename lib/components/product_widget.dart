import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/components/app_constants.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/models/product_model.dart';
import 'package:spare_ease/pages/product_details.dart';
import 'package:spare_ease/providers/products_provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    required this.productId,
    super.key,
  });
  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    //final productsModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final getCurrentProduct = productsProvider.findById(widget.productId);

    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(
                    context, ProductDetailsScreen.routeName,
                    arguments: getCurrentProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TitlesTextWidget(
                            label: getCurrentProduct.productTitle,
                            fontSize: 18,
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(IconlyLight.heart),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: TitlesTextWidget(
                            label: getCurrentProduct.productBrand,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                      width:
                                          2), // Space between "LKR" and the value
                                ),
                                TextSpan(
                                  text: getCurrentProduct.productPrice,
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
                        Flexible(
                          child: Material(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.amber,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              onTap: () {},
                              splashColor: Color.fromRGBO(75, 62, 53, 1),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.add_shopping_cart_outlined,
                                    size: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          );
  }
}
