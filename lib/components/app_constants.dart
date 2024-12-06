import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/models/categories_model.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "batteries",
      image: AssetsManager.batteries,
      name: "Batteries",
    ),
    CategoriesModel(
      id: "accecories",
      image: AssetsManager.helmet,
      name: "Accecories",
    ),
    CategoriesModel(
      id: "Pumps",
      image: AssetsManager.pumps,
      name: "Pumps",
    ),
    CategoriesModel(
      id: "Tyres",
      image: AssetsManager.tyres,
      name: "Tyres",
    ),
    CategoriesModel(
      id: "Lights",
      image: AssetsManager.lights,
      name: "Lights",
    ),
  ];
}

class AppConstants2 {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Batteries',
    'Lights',
    'Pumps',
    'Sockets',
    'Tyres',
    "Accessories",
  ];
  static List<String> brandsList = [
    'Bajaj',
    'TVS',
    'Yamaha',
    'Honda',
    'ScootyPept',
    'Toshiba',
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }

  static List<DropdownMenuItem<String>>? get brandsDropDownList {
    List<DropdownMenuItem<String>>? menu1Item =
        List<DropdownMenuItem<String>>.generate(
      brandsList.length,
      (index) => DropdownMenuItem(
        value: brandsList[index],
        child: Text(brandsList[index]),
      ),
    );
    return menu1Item;
  }
}
