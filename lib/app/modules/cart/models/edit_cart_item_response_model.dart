// To parse this JSON data, do
//
//     final editCartItemResponseModel = editCartItemResponseModelFromJson(jsonString);

import 'dart:convert';

EditCartItemResponseModel editCartItemResponseModelFromJson(String str) =>
    EditCartItemResponseModel.fromJson(json.decode(str));

String editCartItemResponseModelToJson(EditCartItemResponseModel data) =>
    json.encode(data.toJson());

class EditCartItemResponseModel {
  EditCartItemResponseModel({
    this.status,
    this.data,
    this.totalCarts,
    this.message,
    this.userMsg,
  });

  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  factory EditCartItemResponseModel.fromJson(Map<String, dynamic> json) =>
      EditCartItemResponseModel(
        status: json["status"],
        data: json["data"],
        totalCarts: json["total_carts"],
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "total_carts": totalCarts,
        "message": message,
        "user_msg": userMsg,
      };
}
