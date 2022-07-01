import 'dart:convert';

CartItemResponseModel cartItemResponseModelFromJson(String str) =>
    CartItemResponseModel.fromJson(json.decode(str));

String cartItemResponseModelToJson(CartItemResponseModel data) =>
    json.encode(data.toJson());

class CartItemResponseModel {
  CartItemResponseModel({
    this.status,
    this.data,
    this.count,
    this.total,
  });

  int? status;
  List<Datum>? data;
  int? count;
  int? total;

  factory CartItemResponseModel.fromJson(Map<String, dynamic> json) =>
      CartItemResponseModel(
        status: json["status"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.productId,
    this.quantity,
    this.product,
  });

  int? id;
  int? productId;
  int? quantity;
  Product? product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "quantity": quantity,
        "product": product != null ? product!.toJson() : null,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.cost,
    this.productCategory,
    this.productImages,
    this.subTotal,
  });

  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        productCategory: json["product_category"],
        productImages: json["product_images"],
        subTotal: json["sub_total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "product_category": productCategory,
        "product_images": productImages,
        "sub_total": subTotal,
      };
}
