class LoginModel {
  final String tokenType;
  final String accessToken;
  final String? role;

  LoginModel({
    required this.tokenType,
    required this.accessToken,
    this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      tokenType: json["tokenType"],
      accessToken: json["accessToken"],
      role: json["role"],
    );
  }
}
