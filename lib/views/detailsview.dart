import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  String detailimage;
  String detailtitle;
  String? detaildescribtion;
  DetailsView(
      {super.key,
      required this.detaildescribtion,
      required this.detailimage,
      required this.detailtitle});

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
              imageUrl: detailimage,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            detailtitle,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            detaildescribtion!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
