import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',
      responseType: ResponseType.json,
    ),
  );

  fetchData() async {
    // final response = await _dio.get(
    //     'v2/top-headlines?country=us&apiKey=pub_20739694939bdd1c699d875f70ecb4391e6d7');
    final response = await _dio.get(
        'v2/top-headlines?country=us&apiKey=094abddfda1944fb87d868677f3005ee');
    return response.data;
  }

  fetchNewsBySearching(String title) async {
    var response = await _dio
        .get('v2/everything?q=$title&apiKey=094abddfda1944fb87d868677f3005ee');

    return response.data;
  }
}
