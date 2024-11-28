import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:spare_ease/components/app_name_text.dart';
import 'package:spare_ease/components/assets_manager.dart';
import 'package:spare_ease/components/latest_arrival.dart';
import 'package:spare_ease/components/title_text.dart';
import 'package:spare_ease/components/app_constants.dart';

class Home extends StatelessWidget {
  static const routName = "/HomePage";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: const AppNameTextWidget(
          fontSize: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(50),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      AppConstants.bannersImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: AppConstants.bannersImages.length,
                  pagination: const SwiperPagination(
                    // alignment: Alignment.center,
                    builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.red, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const TitlesTextWidget(label: "Latest arrival"),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LatestArrivalProductsWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
