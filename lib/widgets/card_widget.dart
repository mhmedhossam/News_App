import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/newsview.dart';

import '../models/category_model.dart';
//import '../views/newsview.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.listCardModel,
  });
  final CategoryModel listCardModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return Newsview(
              kind: listCardModel.categoryName,
            );
          }),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        //height 120 IN MAIN SIZEDBOX
        width: 170,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(listCardModel.image)),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          listCardModel.categoryName,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
