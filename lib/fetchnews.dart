import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';

import 'data_model.dart';


class FetchNews{
  static final List sourceId=[
    "the-hindu",
    "google-news",
    "the-times-of-india"
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "financial-post",
    "fox-news",
    "fox-sports",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<DataModel> fetchNews()async
  {
    final random= Random();
    var element=sourceId[random.nextInt(sourceId.length)];

    Response response= await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$element&apiKey=2ebc75cbe48f4a2c956ca132b8167112"));
    Map result=jsonDecode(response.body);

    List article=result["articles"];

    final random1= Random();
    var myArticle=article[random1.nextInt(article.length)];
    return DataModel.transport(myArticle);
  }
}