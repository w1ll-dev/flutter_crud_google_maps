import 'package:flutter/cupertino.dart';

class Establishment {
  final int id;
  final String name;
  final double lat;
  final double lng;
  final String createdAt;
  final String updatedAt;

  Establishment({
    this.id,
    @required this.name,
    @required this.lat,
    @required this.lng,
    this.createdAt,
    this.updatedAt,
  });

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      id: json["id"],
      name: json["name"],
      lat: json["lat"],
      lng: json["lng"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
