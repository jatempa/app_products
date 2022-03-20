import 'package:dio/dio.dart';

class Api {
  Dio get dio {
    final _dio = Dio();
    //set base url
    _dio.options.baseUrl = 'https://fakestoreapi.com/';
    return _dio;
  }
}