import 'dart:convert';

PlaceOrderResponseModel placeOrderResponseModelFromJson(String str) =>
    PlaceOrderResponseModel.fromJson(json.decode(str));

String placeOrderResponseModelToJson(PlaceOrderResponseModel data) =>
    json.encode(data.toJson());

class PlaceOrderResponseModel {
  PlaceOrderResponseModel({
    this.status,
    this.data,
    this.message,
    this.userMsg,
  });

  int? status;
  dynamic data;
  String? message;
  String? userMsg;

  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      PlaceOrderResponseModel(
        status: json["status"],
        data: json["data"],
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "message": message,
        "user_msg": userMsg,
      };
}

