import 'dart:convert';

List<OrderItem> ordItemFromJson(String str) => List<OrderItem>.from(json.decode(str).map((x) => OrderItem.fromJson(x)));

String ordItemToJson(List<OrderItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItem {
  OrderItem({
    this.id,
    this.qty,
    this.unit,
  });

  String id;
  String qty;
  String unit;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    qty: json["qty"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "qty": qty,
    "unit": unit,
  };
}