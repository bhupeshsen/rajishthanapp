import 'dart:convert';

ErrorBody errorBodyFromJson(String str) => ErrorBody.fromJson(json.decode(str));

String errorBodyToJson(ErrorBody data) => json.encode(data.toJson());

/// Error model class
class ErrorBody {
  ErrorBody({
    this.detail,
    this.statusCode,
  });

  Detail? detail;
  int? statusCode;

  factory ErrorBody.fromJson(Map<String, dynamic> json) => ErrorBody(
        detail: Detail.fromJson(json["detail"]),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail?.toJson(),
        "status_code": statusCode,
      };
}

class Detail {
  Detail({
    this.message,
  });

  String? message;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
