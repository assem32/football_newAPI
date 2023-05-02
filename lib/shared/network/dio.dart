
// https://newsapi.org/
// v2/top-headlines
// ?country=eg&category=business&apiKey=beaf25f8d2f844f8a63df0ef14b7ab5a

import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.football-data.org/',
        headers: {
          'X-Auth-Token':'e2962fbfe483410a82e158871f822f0a'
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
     Map<String,dynamic>? query,
  })
  async
  {
    return await dio.get( url, queryParameters: query, );
  }
}