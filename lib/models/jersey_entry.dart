// To parse this JSON data, do
//
//     final jerseyEntry = jerseyEntryFromJson(jsonString);

import 'dart:convert';

List<JerseyEntry> jerseyEntryFromJson(String str) => List<JerseyEntry>.from(json.decode(str).map((x) => JerseyEntry.fromJson(x)));

String jerseyEntryToJson(List<JerseyEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JerseyEntry {
    String model;
    String pk;
    Fields fields;

    JerseyEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory JerseyEntry.fromJson(Map<String, dynamic> json) => JerseyEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    String image;
    int quantity;
    DateTime time;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.image,
        required this.quantity,
        required this.time,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        quantity: json["quantity"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "quantity": quantity,
        "time": time.toIso8601String(),
    };
}