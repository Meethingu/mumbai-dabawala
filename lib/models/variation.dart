import 'dart:convert';

List<Variation> variationFromJson(String str) => List<Variation>.from(json.decode(str).map((x) => Variation.fromJson(x)));

String variationToJson(List<Variation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Variation {
  Variation({
    this.id,
    this.productId,
    this.productUnit,
    this.productStock,
    this.productPrice,
  });

  String id;
  String productId;
  String productUnit;
  String productStock;
  String productPrice;

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
    id: json["id"],
    productId: json["product_id"],
    productUnit: json["product_unit"],
    productStock: json["product_stock"],
    productPrice: json["product_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_unit": productUnit,
    "product_stock": productStock,
    "product_price": productPrice,
  };
}