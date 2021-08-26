import 'package:brinvestyuk/models/register_otp_model.dart';
import 'package:brinvestyuk/services/register.dart';
import 'package:brinvestyuk/view_models/register_otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterOtpListView extends ChangeNotifier {
  RegisterOtpViewModel? register;

  Future<void> doVerificationOtp(String email, String otp) async {
    dynamic request = await Register().registerOtp(email, otp);

    if (request is RegisterOtpModel) {
      this.register = RegisterOtpViewModel(registerOtp: request);
    } else {
      this.register = null;
      Fluttertoast.showToast(msg: request);
    }

    notifyListeners();
  }
}
