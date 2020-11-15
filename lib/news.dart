import 'package:http/http.dart' as http;
import "article.dart";
import "dart:convert";

class News {
  List<Article> news = [];
  Future<void> getNews() {
    String url =
        "https://newsapi.org/v2/${headlines}?country=us&apiKey=${api_key}";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData.forEach((element) {
        Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urltoimage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content']);
        news.add(article);
      });
    }
  }
}
