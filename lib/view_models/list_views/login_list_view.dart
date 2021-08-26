import 'package:brinvestyuk/models/login_model.dart';
import 'package:brinvestyuk/services/login.dart';
import 'package:flutter/material.dart';

class LoginListView extends ChangeNotifier {
  LoginModel? login;

  void doLogin(String email, String password) async {
    try {
      LoginModel loginModel = await Login().login(email, password);
      notifyListeners();

      this.login = loginModel;
      notifyListeners();

      notifyListeners();
    } on Exception catch (e) {
      throw e;
    }
  }
}
