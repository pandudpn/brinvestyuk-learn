import 'package:brinvestyuk/models/login_model.dart';

class LoginViewModel {
  LoginModel _loginModel;

  LoginViewModel({required LoginModel login}) : _loginModel = login;

  String get token {
    return _loginModel.accessToken;
  }

  String get tokenType {
    return _loginModel.tokenType;
  }

  String get role {
    return _loginModel.role!;
  }
}
