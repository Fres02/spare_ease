import 'package:flutter/material.dart';
import 'package:spare_ease/components/subtitle_text.dart';
import 'package:spare_ease/pages/search.dart';

class BrandRoundedWidget extends StatelessWidget {
  const BrandRoundedWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image, name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchPage.routeName, arguments: name);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          SubtitleTextWidget(
            label: name,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
