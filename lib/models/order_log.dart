import 'dart:convert';

List<OrderLog> ologFromJson(String str) => List<OrderLog>.from(json.decode(str).map((x) => OrderLog.fromJson(x)));

String ologToJson(List<OrderLog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderLog {
  OrderLog({
    this.code,
    this.status,
    this.message,
    this.timestamp,
  });

  String code;
  String status;
  String message;
  DateTime timestamp;

  factory OrderLog.fromJson(Map<String, dynamic> json) => OrderLog(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "timestamp": timestamp.toIso8601String(),
  };
}