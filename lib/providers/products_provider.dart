import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/product_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return products;
  }

  ProductModel? findById(String productId) {
    if (products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String categoryName}) {
    List<ProductModel> categoryList = products
        .where((element) =>
            element.productCategory
                .toLowerCase()
                .contains(categoryName.toLowerCase()) ||
            element.productBrand
                .toLowerCase()
                .contains(categoryName.toLowerCase()))
        .toList();
    return categoryList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where(
          (element) => element.productTitle.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return searchList;
  }

  List<ProductModel> products = [
    // Phones
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
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Exide MF5A-3-LT",
      productPrice: "7,750",
      productCategory: "Battery",
      productBrand: "Exide",
      productDescription:
          "Discover 100/125/135, Pulser 135, Tvs Scooter Pep, Wego \n 1 Year Company Warranty\n Nominal Voltage (V)-12\n Capacity (Ah)-5\n CCA (A)-100\n Dimensions (mm)	Length-120\n Height-130\n Width	60\n Wet Weight-(Kg)	2.1",
      productImage:
          "https://www.brownsgroup.lk/images/site-specific/products/exide-motorcycle/45-mf5a-3-lt.jpg",
      productQuantity: "16",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Arpico Evergy Battery 12V 5AH",
      productPrice: "5,500",
      productCategory: "Battery",
      productBrand: "Arpico",
      productDescription:
          "HONDA DIO ON LIGHT, PLATINA NEW, S/START, SAFFARI, HERO HONDA NXG,CUSTOM (China),HERO HONDA NXG, S-STAR, HONDA NAVI.,CD 90 (CHINA), SUPER CUB, PRESS CUB, MD 90, CD 50, LX 48 CC \n Product Dimentions (Length x Width x Height)\n 12.4-6.4-13.6 CM",
      productImage:
          "https://sanduntyre.com/wp-content/uploads/2022/09/12V-5-scaled.jpg",
      productQuantity: "16",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Led Light For Motorcycle Tail Indicator Turn Signal",
      productPrice: "2,640",
      productCategory: "Lights",
      productBrand: "Mosaike Modifiable Accessories Co.Ltd",
      productDescription:
          "Purpose - for replace/repair \n Condition - New \n Brand Name - Motocircuit \n  Warranty - 1 Year\n Fitment	Universal Fit \n Voltage	DC - 12V \n Color - Multiple Colors",
      productImage:
          "https://s.alicdn.com/@sc04/kf/H88ae35e4687c49ab88279f13dedc037cm.jpg_720x720q50.jpg",
      productQuantity: "40",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Super Meteor Continental GT 650 Bike Light",
      productPrice: "5,800",
      productCategory: "Lights",
      productBrand: "Mosaike Modifiable Accessories Co.Ltd",
      productDescription:
          "Purpose - for retrofit/upgrade \n Condition -  New \n Brand Name  - Motocircuit \n  Warranty - 12 months \n Power - 84W@High Beam, 54W@Low Beam\n Voltage - DC - 12V \n Color - Multiple Colors",
      productImage:
          "https://s.alicdn.com/@sc04/kf/H1880b37eca3548dc9de29bb2649d29a3c.jpg_720x720q50.jpg",
      productQuantity: "7",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle: "Turn Signal Light Flowing Water Indicator Direction Lamp",
      productPrice: "3,000",
      productCategory: "Lights",
      productBrand: "Mosaike Modifiable Accessories Co.Ltd",
      productDescription:
          "Purpose - for retrofit/upgrade \n Type - Led Motorcycle Turn Signal Light \n Condition  -  New \n Brand Name - Motocircuit \n  Warranty - 60 DAYS \n Power - 84W@High Beam, 54W@Low Beam\n Voltage - DC - 12V \n Color - Multiple Colors",
      productImage:
          "https://s.alicdn.com/@sc04/kf/Hf169d4831f5c4cb1a68b02f20e448e41c.jpg_720x720q50.jpg",
      productQuantity: "87",
    ),
    ProductModel(
      productId: const Uuid().v4(),
      productTitle:
          " Dual color Owl Design Moto 2 led laser work light fog light",
      productPrice: "9,100",
      productCategory: "Lights",
      productBrand: "Mosaike Modifiable Accessories Co.Ltd",
      productDescription:
          "Purpose - for retrofit/upgrade \n Condition - New \n Brand Name - Motocircuit \n  Warranty - 1year \n Power - 25W@High Beam\n Voltage - DC - 12V \n Color - white+yellow \n Light source - 2 LED",
      productImage:
          "https://s.alicdn.com/@sc04/kf/H9a66c7efddb645f8bfdbd2bca9c5ecd4n.jpg_720x720q50.jpg",
      productQuantity: "87",
    )
  ];
}
