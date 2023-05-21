import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

/// More examples see https://github.com/cfug/dio/blob/main/example
Future<NewsModel?> getAllNews() async {
  final dio = Dio();
  final response = await dio.get(
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3d4340334b73473fbf7a284e88b154d9');
  print(response.data);
  if (response.statusCode == 200) {
    var userResponse = jsonDecode(response.toString());
    NewsModel allNews = NewsModel.fromJson(userResponse);

    return allNews;
  } else {
    return null;
  }
}
