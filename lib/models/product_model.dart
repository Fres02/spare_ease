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
      productId: 'dhara-12v5-3B',
      productTitle: "Dhara Bike Battery 12V5-3B",
      productPrice: "5,350",
      productCategory: "Battery",
      productBrand: "Dhara",
      productDescription:
          "Discover 100/125/135, Pulser 135, Tvs Scooter Pep, Wego, Glammer, Fz V1\n 1 Year Company Warranty\n Nominal Voltage (V)-12\n Capacity (Ah)-5\n CCA (A)-90\n Dimensions (mm)	Length-120\n Height-130\n Width	60\n Wet Weight-(Kg)	2.0",
      productImage:
          "https://static-01.daraz.lk/p/2aa94d5043157e1e8d2935059d28850b.jpg",
      productQuantity: "10",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Dhara Bike Battery 12V9-2A",
      productPrice: "8,750",
      productCategory: "Battery",
      productBrand: "Dhara",
      productDescription:
          "Discover 100/125/135, Pulser 135, Tvs Scooter Pep, Wego \n 1 Year Company Warranty\n Nominal Voltage (V)-12\n Capacity (Ah)-9\n CCA (A)-100\n Dimensions (mm)	Length-120\n Height-130\n Width	60\n Wet Weight-(Kg)	2.1",
      productImage:
          "https://bambuwa.lk/wp-content/uploads/2023/11/WhatsApp-Image-2023-11-22-at-15.14.05_35f7012a.jpg",
      productQuantity: "10",
    )
  ];
}
