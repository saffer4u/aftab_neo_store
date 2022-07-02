import 'dart:convert';

ResetPasswordResponseModel resetPasswordResponseModelFromJson(String str) =>
    ResetPasswordResponseModel.fromJson(json.decode(str));

String resetPasswordResponseModelToJson(ResetPasswordResponseModel data) =>
    json.encode(data.toJson());

class ResetPasswordResponseModel {
  ResetPasswordResponseModel({
    this.status,
    this.message,
    this.userMsg,
  });

  int? status;
  String? message;
  String? userMsg;

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponseModel(
        status: json["status"],
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_msg": userMsg,
      };
}
