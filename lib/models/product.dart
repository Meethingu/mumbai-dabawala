import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Product sproductFromJson(String str) => Product.fromJson(json.decode(str));

String sproductToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productId,
    this.productName,
    this.categoryId,
    this.categoryName,
    this.productPrice,
    this.productStatus,
    this.productImageName,
    this.productDescription,
    this.productStock,
    this.productUnit,
    this.productRefundable,
    this.productDiscount,
    this.currencyId,
    this.tax,
    this.currencyCode,
    this.currencyName,
  });

  String productId;
  String productName;
  String categoryId;
  String categoryName;
  String productPrice;
  String productStatus;
  String productImageName;
  String productDescription;
  String productStock;
  String productUnit;
  String productRefundable;
  String productDiscount;
  String currencyId;
  String tax;
  String currencyCode;
  String currencyName;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    productPrice: json["product_price"],
    productStatus: json["product_status"],
    productImageName: json["product_image_name"],
    productDescription: json["product_description"],
    productStock: json["product_stock"],
    productUnit: json["product_unit"],
    productRefundable: json["product_refundable"],
    productDiscount: json["product_discount"],
    currencyId: json["currency_id"],
    tax: json["tax"],
    currencyCode: json["currency_code"],
    currencyName: json["currency_name"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "category_id": categoryId,
    "category_name": categoryName,
    "product_price": productPrice,
    "product_status": productStatus,
    "product_image_name": productImageName,
    "product_description": productDescription,
    "product_stock": productStock,
    "product_unit": productUnit,
    "product_refundable": productRefundable,
    "product_discount": productDiscount,
    "currency_id": currencyId,
    "tax": tax,
    "currency_code": currencyCode,
    "currency_name": currencyName,
  };
}
