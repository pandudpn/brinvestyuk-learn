import 'package:brinvestyuk/models/register_model.dart';
import 'package:brinvestyuk/services/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterListView extends ChangeNotifier {
  RegisterModel? register;

  Future<void> doRegister(String email, String password) async {
    dynamic request = await Register().register(email, password);

    if (request is RegisterModel) {
      this.register = request;
    } else {
      this.register = null;
      Fluttertoast.showToast(msg: request);
    }

    notifyListeners();
  }
}
