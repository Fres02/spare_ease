import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/components/app_name_text.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/category_rounded_widget.dart';
import 'package:spare_ease/components/latest_arrival.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/components/app_constants.dart';
import 'package:spare_ease/providers/products_provider.dart';

class Home extends StatelessWidget {
  static const routeName = "/HomePage";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.logo,
          ),
        ),
        title: const AppNameTextWidget(
          fontSize: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Color.fromRGBO(75, 62, 53, 1),
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const TitlesTextWidget(label: "Latest Arrival"),
              const SizedBox(height: 15.0),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: productsProvider.getProducts[index],
                          child: LatestArrivalProductsWidget());
                    }),
              ),
              const TitlesTextWidget(label: "Categories"),
              const SizedBox(height: 15.0),
              SizedBox(
                height: size.height * 0.1,
                child: GridView.count(
                  crossAxisCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CategoryRoundedWidget(
                        image: AssetsManager.batteries, name: "Batteries"),
                    CategoryRoundedWidget(
                        image: AssetsManager.helmet, name: "Accessories"),
                    CategoryRoundedWidget(
                        image: AssetsManager.lights, name: "Lights"),
                    CategoryRoundedWidget(
                        image: AssetsManager.tyres, name: "Tyres"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const TitlesTextWidget(label: "Brands"),
              const SizedBox(height: 15.0),
              SizedBox(
                height: size.height * 0.1,
                child: GridView.count(
                  crossAxisCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CategoryRoundedWidget(
                        image: AssetsManager.bajaj, name: "Bajaj"),
                    CategoryRoundedWidget(
                        image: AssetsManager.yamaha, name: "Yamaha"),
                    CategoryRoundedWidget(
                        image: AssetsManager.honda, name: "Honda"),
                    CategoryRoundedWidget(
                        image: AssetsManager.tyres, name: "TVS"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}



//start backend now