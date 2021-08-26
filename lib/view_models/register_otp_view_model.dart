import 'package:brinvestyuk/models/register_otp_model.dart';

class RegisterOtpViewModel {
  RegisterOtpModel? _registerOtpModel;

  RegisterOtpViewModel({RegisterOtpModel? registerOtp})
      : _registerOtpModel = registerOtp;

  String get accessToken {
    return _registerOtpModel!.accessToken;
  }

  String get tokenType {
    return _registerOtpModel!.tokenType;
  }

  String get token {
    return "$tokenType $accessToken";
  }
}
