import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/components/app_constants.dart';
import 'package:spare_ease/components/app_name_text.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/providers/cart_provider.dart';
import 'package:spare_ease/providers/products_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const routeName = "/ProductDetailsScreen";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrentProduct = productsProvider.findById(productId!);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: const AppNameTextWidget(fontSize: 30),
      ),
      body: getCurrentProduct == null
          ? const Center(child: Text("Product not found"))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  FancyShimmerImage(
                    imageUrl: AppConstants.imageUrl,
                    height: size.height * 0.3,
                    width: double.infinity,
                    boxFit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),

                  // Product Info Row
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Product Title
                        Expanded(
                          child: Text(
                            getCurrentProduct.productTitle,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Product Brand
                        TitlesTextWidget(
                          label: getCurrentProduct.productBrand,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),

                  // Price Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "LKR ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: getCurrentProduct.productPrice,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // About Product
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "About the item"),
                        const SizedBox(height: 10),
                        SubtitleTextWidget(
                          label: "In ${getCurrentProduct.productCategory}",
                        ),
                        const SizedBox(height: 10),
                        SubtitleTextWidget(
                          label: getCurrentProduct.productDescription,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add to Cart Button
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(75, 62, 53, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        if (cartProvider.isProdinCart(
                            productId: getCurrentProduct.productId)) {
                          return;
                        }
                        cartProvider.addProductToCart(
                            productId: getCurrentProduct.productId);
                      },
                      icon: Icon(
                        cartProvider.isProdinCart(
                                productId: getCurrentProduct.productId)
                            ? Icons.check
                            : Icons.add_shopping_cart_outlined,
                      ),
                      label: Text(
                        cartProvider.isProdinCart(
                                productId: getCurrentProduct.productId)
                            ? "In cart"
                            : "Add to cart",
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
