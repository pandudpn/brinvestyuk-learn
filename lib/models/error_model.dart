class ErrorModel {
  final String reason;

  ErrorModel({required this.reason});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(reason: json["reason"]);
  }
}
