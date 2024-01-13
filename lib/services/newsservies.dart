import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class Newservice {
  Dio dio = Dio();
  Newservice({
    required this.dio,
  });

  Future<List<ArticleModel>> getNews({required String kind}) async {
    try {
      Response response = await dio.get(
          "https://newsdata.io/api/1/news?apikey=pub_36359720dbe5df5c3391bf94c281e2573ec1d&q=$kind");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> results = jsonData['results'];
      List<ArticleModel> articlesList = [];
      for (var article in results) {
        ArticleModel articleModel = ArticleModel(
            image: article["image_url"],
            subtitle: article['description'],
            title: article["title"]);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      print("error hamada");
      return [];
    }
  }
}
