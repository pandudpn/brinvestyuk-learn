import 'dart:convert';

import 'package:brinvestyuk/models/error_model.dart';
import 'package:brinvestyuk/models/login_model.dart';
import 'package:brinvestyuk/services/web_service.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login {
  Future<LoginModel> login(String email, String password) async {
    String url = "https://api-staging.brinvestyuk.com/auth/login/users";
    var data = {"email": email, "password": password};

    // FormData payload = FormData.fromMap(data);
    Options options = Options(headers: {
      "x-api-key": "0d8889998ae4f692794200d11d4e0d6278e169da",
      "Content-Type": "application/json",
    });

    try {
      final res = await WebService.post(url, jsonEncode(data), options);
      if (res.runtimeType == ErrorModel) {
        Fluttertoast.showToast(
          msg: res.reason,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
        );

        throw res.reason;
      }

      return LoginModel.fromJson(res["data"]);
    } on Exception catch (e) {
      throw e;
    }
  }
}
