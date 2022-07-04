// To parse this JSON data, do
//
//     final orderDetailResponseModel = orderDetailResponseModelFromJson(jsonString);

import 'dart:convert';

OrderDetailResponseModel orderDetailResponseModelFromJson(String str) =>
    OrderDetailResponseModel.fromJson(json.decode(str));

String orderDetailResponseModelToJson(OrderDetailResponseModel data) =>
    json.encode(data.toJson());

class OrderDetailResponseModel {
  OrderDetailResponseModel({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponseModel(
        status: json["status"],
        data:json["data"]!=null? Data.fromJson(json["data"]):null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.cost,
    this.address,
    this.orderDetails,
  });

  int? id;
  int? cost;
  String? address;
  List<OrderDetail>? orderDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        cost: json["cost"],
        address: json["address"],
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cost": cost,
        "address": address,
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.total,
    this.prodName,
    this.prodCatName,
    this.prodImage,
  });

  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        total: json["total"],
        prodName: json["prod_name"],
        prodCatName: json["prod_cat_name"],
        prodImage: json["prod_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "total": total,
        "prod_name": prodName,
        "prod_cat_name": prodCatName,
        "prod_image": prodImage,
      };
}
