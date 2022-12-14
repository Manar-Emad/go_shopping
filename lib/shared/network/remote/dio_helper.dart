import 'package:dio/dio.dart';
import 'package:go_shopping/shared/network/end_points.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.url,
        receiveDataWhenStatusError: true,
      //  headers: {'Content-Type':'application/json',}
        headers: {
          'Content-Type':'application/json',
          'lang':'en',
        },
      ),
    );
  }

  ///GET DATA
  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await dio!.get(
      url,
      queryParameters: query ?? null,
    );
  }

  ///POST DATA
  static Future<Response> postData({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers={
        'lang':lang,
        'Authorization':token,
      };
    return dio!.post(url, queryParameters: query, data: data);
  }
}
