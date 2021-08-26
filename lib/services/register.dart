import 'dart:convert';

import 'package:brinvestyuk/models/error_model.dart';
import 'package:brinvestyuk/models/register_model.dart';
import 'package:brinvestyuk/models/register_otp_model.dart';
import 'package:brinvestyuk/services/web_service.dart';
import 'package:dio/dio.dart';

class Register {
  dynamic register(String email, String password) async {
    String url = "https://api-staging.brinvestyuk.com/auth/register/users";
    var data = {"email": email, "password": password};

    // FormData payload = FormData.fromMap(data);
    Options options = Options(headers: {
      "x-api-key": "0d8889998ae4f692794200d11d4e0d6278e169da",
      "Content-Type": "application/json",
    });

    try {
      final res = await WebService.post(url, jsonEncode(data), options);
      if (res.runtimeType == ErrorModel) {
        return res.reason;
      }

      return RegisterModel.fromJson(res);
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerOtp(String email, String otp) async {
    String url = "https://api-staging.brinvestyuk.com/auth/validate";
    var data = {"email": email, "otp": otp};

    // FormData payload = FormData.fromMap(data);
    Options options = Options(headers: {
      "x-api-key": "0d8889998ae4f692794200d11d4e0d6278e169da",
      "Content-Type": "application/json",
    });

    try {
      final res = await WebService.post(url, jsonEncode(data), options);

      if (res.runtimeType == ErrorModel) {
        return res.reason;
      }

      return RegisterOtpModel.fromJson(res["data"]);
    } on Exception catch (e) {
      throw e;
    }
  }
}
