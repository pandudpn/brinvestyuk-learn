class RegisterOtpModel {
  final String accessToken;
  final String tokenType;

  RegisterOtpModel({required this.accessToken, required this.tokenType});

  factory RegisterOtpModel.fromJson(Map<String, dynamic> json) {
    return RegisterOtpModel(
      accessToken: json["accessToken"],
      tokenType: json["tokenType"],
    );
  }

  dynamic toJson() {
    return {"accessToken": accessToken, "tokenType": tokenType};
  }
}
