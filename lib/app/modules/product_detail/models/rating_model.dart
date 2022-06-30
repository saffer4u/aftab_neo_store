import 'dart:convert';

RatingModel ratingModelFromJson(String str) =>
    RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  RatingModel({
    this.status,
    this.message,
    this.userMsg,
  });

  final int? status;
  final String? message;
  final String? userMsg;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
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
