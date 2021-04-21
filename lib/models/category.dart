import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.productCount,
  });

  String categoryId;
  String categoryName;
  String categoryImage;
  String productCount;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    productCount: json["product_count"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "product_count": productCount,
  };
}
