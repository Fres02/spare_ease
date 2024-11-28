import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spare_ease/components/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 22),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitlesTextWidget(
        label: "SpareEase",
        fontSize: fontSize,
      ),
    );
  }
}
