import 'package:dio/dio.dart';

class Api {
  static final Api _singleton = new Api._internal();
  static const baseUrl = 'https://fakestoreapi.com/';

  factory Api() {
    return _singleton;
  }

  Api._internal();

  Dio get dio {
    Dio dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        //set base url
        options.baseUrl = '$baseUrl';

        return handler.next(options);
      }
    ));

    return dio;
  }
}