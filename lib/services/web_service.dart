import 'dart:convert';

import 'package:brinvestyuk/models/error_model.dart';
import "package:dio/dio.dart";
import "package:brinvestyuk/models/article_model.dart";
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';

class WebService {
  static dynamic post(String url, String? data, Options? options) async {
    var dio = new Dio();

    try {
      final response = await dio.post(
        url,
        data: data,
        options: options,
      );
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ErrorModel.fromJson(e.response!.data["status"]);
      }
      throw Exception(e);
    }
  }

  static dynamic get(String url, Options? options) async {
    var dio = new Dio();

    final response = await dio.get(
      url,
      options: options,
    );

    try {
      print("lah masuk sini");
      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }
}
