import 'package:brinvestyuk/models/register_model.dart';

class RegisterViewModel {
  RegisterModel _registerModel;

  RegisterViewModel({required RegisterModel login}) : _registerModel = login;

  String get data {
    return _registerModel.data;
  }
}
