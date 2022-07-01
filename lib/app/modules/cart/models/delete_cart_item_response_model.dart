import 'dart:convert';

DeleteCartItemResponseModel deleteCartItemResponseModelFromJson(String str) =>
    DeleteCartItemResponseModel.fromJson(json.decode(str));

String deleteCartItemResponseModelToJson(DeleteCartItemResponseModel data) =>
    json.encode(data.toJson());

class DeleteCartItemResponseModel {
  DeleteCartItemResponseModel({
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

  factory DeleteCartItemResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteCartItemResponseModel(
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
