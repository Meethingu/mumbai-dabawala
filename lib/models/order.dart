import 'dart:convert';

List<Order> orderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.code,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.shipping,
    this.dateTime,
    this.orderTotal,
    this.status,
  });

  String id;
  String code;
  String name;
  String email;
  String phone;
  String address;
  String shipping;
  DateTime dateTime;
  String orderTotal;
  String status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    shipping: json["shipping"],
    dateTime: DateTime.parse(json["date_time"]),
    orderTotal: json["order_total"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "shipping": shipping,
    "date_time": dateTime.toIso8601String(),
    "order_total": orderTotal,
    "status": status,
  };
}