// To parse this JSON data, do
//
//     final orderListResponseModel = orderListResponseModelFromJson(jsonString);

import 'dart:convert';

OrderListResponseModel orderListResponseModelFromJson(String str) =>
    OrderListResponseModel.fromJson(json.decode(str));

String orderListResponseModelToJson(OrderListResponseModel data) =>
    json.encode(data.toJson());

class OrderListResponseModel {
  OrderListResponseModel({
    this.status,
    this.data,
    this.message,
    this.userMsg,
  });

  int? status;
  List<Datum>? data;
  String? message;
  String? userMsg;

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderListResponseModel(
        status: json["status"],
        data:json["data"]!=null? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))):null,
        message: json["message"],
        userMsg: json["user_msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "user_msg": userMsg,
      };
}

class Datum {
  Datum({
    this.id,
    this.cost,
    this.created,
  });

  int? id;
  int? cost;
  String? created;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        cost: json["cost"],
        created: json["created"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost,
        "created": created,
      };
}
