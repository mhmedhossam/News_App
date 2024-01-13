import 'package:flutter/material.dart';
import '../widgets/category_listview.dart';
import '../widgets/newslistviewbuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
          ]),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5,
                ),
              ),
              NewsListViewBuilder(kindnews: "sport"),
            ],
          ),
        ));
  }
}
