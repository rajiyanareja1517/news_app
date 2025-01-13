import 'dart:convert';

import 'package:news_app/utils/contents.dart';
import 'package:http/http.dart' as http;

import '../model/article.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices apiServices = ApiServices._();

  Future<List<Article>?> fetchNews(String cat) async {
    String api =
        "https://newsapi.org/v2/top-headlines?category=$cat&apiKey=${Contents.API_KEY}";

    http.Response response = await http.get(Uri.parse("$api"));
    if (response.statusCode == 200) {
    /*
      print("response: ${response.body}");
    */

      Map decodedData = jsonDecode(response.body);

      /*print("response: ${decodedData}");*/
      print("responsee: ${decodedData['articles']}");
      List list = decodedData['articles'];

       List<Article> temp =list.map((e) {
        return Article.fromMap(e);
      }).toList();
      print("List<Article>:::$temp");
      return temp;
    } else {
      print("Error: ${response.statusCode}");
      print("Error: ${response.body}");
      print("Error: ${response.headers}");
      return null;
    }
  }
}
