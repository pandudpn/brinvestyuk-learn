class RegisterModel {
  final String data;

  RegisterModel({required this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(data: json["data"]);
  }

  dynamic toJson() {
    return {"data": data};
  }
}
