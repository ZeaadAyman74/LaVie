import 'package:dio/dio.dart';

import '../../components/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
        BaseOptions(
        baseUrl:'https://lavie.orangedigitalcenteregypt.com' ,

      receiveDataWhenStatusError: true,
        receiveTimeout: 20 * 1000,
        connectTimeout: 20 * 1000,
      ));
  }

  static Future<Response> getData({
    required String path,
    required Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers={
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json'
    };
    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
    String lang='en',
    String? token,
  }) async{

    dio.options.headers={
      'Authorization':'Bearer $token',
      'Accept':'application/json',
      'Content-Type': 'application/json',
    };
   return await dio.post(
      url,
      data: data,
     // queryParameters: query,
    );
  }

  static Future<Response> putData({
  required String? token,
    required String path,
    String lang='en',
    Map<String, dynamic>? query,
    required String name,
    required String email,
    required String phone,
  })async{
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token,
    };
  return await  dio.put(
    path,
    data: {
      "name":name ,
      "phone": phone,
      "email": email,
    }
  );

  }

  static Future<Response> updateUser({
    required String path,
    required dynamic data,
    required Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers={
      'Authorization':'Bearer $token',
      'Content-Type': 'application/json',
      'Accept' : 'application/json',
    };
    return await dio.patch(
      path,
      queryParameters: query,
      data: data,
    );
  }
}
