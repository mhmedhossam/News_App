import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import '../services/newsservies.dart';
import 'newslistview.dart';

// ignore: must_be_immutable
class NewsListViewBuilder extends StatefulWidget {
  final String kindnews;
  const NewsListViewBuilder({
    required this.kindnews,
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = Newservice(
      dio: Dio(),
    ).getNews(kind: widget.kindnews);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            EasyLoading.dismiss();
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            EasyLoading.dismiss();

            return const SliverFillRemaining(
                child: Center(
                    child: Text(
              "opss",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )));
          } else {
            EasyLoading.show(status: "isloading");
            EasyLoading.instance
              ..loadingStyle = EasyLoadingStyle.light
              ..indicatorType = EasyLoadingIndicatorType.chasingDots
              ..indicatorSize = 60.0
              ..indicatorColor = const Color.fromRGBO(255, 235, 59, 1)
              ..backgroundColor = Colors.black
              ..textColor = Colors.yellow
              ..textStyle =
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

            return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}





/*
 if (snapshot.hasData == false) {
              } else if (snapshot.hasError) {
            EasyLoading.dismiss();
              } else {
            EasyLoading.dismiss();
          }
          */
