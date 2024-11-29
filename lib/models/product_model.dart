import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity,
      productBrand; // new added
  Timestamp? createdAt;
  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity,
    required this.productBrand, // new
    this.createdAt,
  });

  // factory ProductModel.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map<String, dynamic>;
  //   // data.containsKey("")
  //   return ProductModel(
  //     productId: data["productId"], //doc.get(field),
  //     productTitle: data['productTitle'],
  //     productPrice: data['productPrice'],
  //     productCategory: data['productCategory'],
  //     productDescription: data['productDescription'],
  //     productImage: data['productImage'],
  //     productQuantity: data['productQuantity'],
  //     productBrand: data['productBrand'],
  //     createdAt: data['createdAt'],
  //   );
  // }

  static List<ProductModel> products = [
    ProductModel(
      //1
      productId: 'iphone14-128gb-black',
      productTitle: "Apple iPhone 14 Pro (128GB) - Black",
      productPrice: "1399.99",
      productCategory: "Phones",
      productBrand: "Apple",
      productDescription:
          "6.1-inch Super Retina XDR display with ProMotion and always-on display. Dynamic Island, a new and magical way to interact with your iPhone. 48MP main camera for up to 4x higher resolution. Cinematic mode, now in 4K Dolby Vision up to 30 fps. Action mode, for stable and smooth videos when you're on the move. Accident detection, vital safety technology that calls for help for you. All-day battery life and up to 23 hours of video playback.",
      productImage: "https://i.ibb.co/BtMBSgK/1-iphone14-128gb-black.webp",
      productQuantity: "10",
    ),
    ProductModel(
      //6
      productId: const Uuid().v4(),
      productTitle:
          "OnePlus 9 Pro 5G LE2120 256GB 12GB RAM Factory Unlocked (GSM Only | No CDMA - not Compatible with Verizon/Sprint) International Version - Morning Mist",
      productPrice: "1099.99",
      productCategory: "Phones",
      productBrand: "Apple",
      productDescription:
          "About this item\n6.7 inch LTPO Fluid2 AMOLED, 1B colors, 120Hz, HDR10+, 1300 nits (peak)\n256GB internal storage, 12GB RAM\nQuad rear camera: 48MP, 50MP, 8MP, 2MP\n16MP front-facing camera\n4500mAh battery with Warp Charge 65T (10V/6.5A) and 50W Wireless Charging\n5G capable for lightning fast download and streaming",
      productImage:
          "https://i.ibb.co/0yhgKVv/6-One-Plus-9-Pro-5-G-LE2120-256-GB-12-GB-RAM.png",
      productQuantity: "3636",
    )
  ];
}
