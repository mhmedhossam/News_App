import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  ArticleModel detailsmodel;

  DetailsView({super.key, required this.detailsmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 15,
        centerTitle: true,
        title: const Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "News",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Cloud",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
          ),
        ]),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: detailsmodel.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            detailsmodel.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            detailsmodel.subtitle ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
