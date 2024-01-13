import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'card_widget.dart';

// ignore: camel_case_types
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> cardList = const [
    CategoryModel(
      categoryName: "technology",
      image: 'assets/technology.jpeg',
    ),
    CategoryModel(
      categoryName: "science",
      image: 'assets/science.avif',
    ),
    CategoryModel(
      categoryName: "health",
      image: 'assets/health.avif',
    ),
    CategoryModel(
      categoryName: "entertaiment",
      image: 'assets/entertaiment.avif',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return CardWidget(
            listCardModel: cardList[index],
          );
        },
      ),
    );
  }
}
