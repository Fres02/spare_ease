import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/models/categories_model.dart';

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
