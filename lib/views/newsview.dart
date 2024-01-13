import 'package:flutter/material.dart';

import '../widgets/newslistviewbuilder.dart';

class Newsview extends StatelessWidget {
  final String kind;
  const Newsview({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        NewsListViewBuilder(
          kindnews: kind,
        )
      ]),
    );
  }
}
