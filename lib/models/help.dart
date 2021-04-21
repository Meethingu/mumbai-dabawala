import 'dart:convert';

List<Help> helpFromJson(String str) => List<Help>.from(json.decode(str).map((x) => Help.fromJson(x)));

String helpToJson(List<Help> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Help {
  Help({
    this.id,
    this.title,
    this.content,
  });

  String id;
  String title;
  String content;

  factory Help.fromJson(Map<String, dynamic> json) => Help(
    id: json["id"],
    title: json["title"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
  };
}