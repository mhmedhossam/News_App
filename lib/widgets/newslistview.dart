import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import 'news_widget.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.articles,
    super.key,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: articles.length,
      (context, index) {
        return NewsWidget(
          articleModel: articles[index],
        );
      },
    ));
  }
}
