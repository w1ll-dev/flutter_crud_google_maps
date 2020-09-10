import 'dart:convert';
import 'package:front_mobile/src/models/establishment_model.dart';
import "package:http/http.dart" as http;

const _serverIp = '10.0.0.118';
const _serverPort = '5000';
const _baseUrl = "http://$_serverIp:$_serverPort";

Future<List<Establishment>> getEstablishments() async {
  final response = await http.get("$_baseUrl/establishments");
  List<dynamic> jsonRes = jsonDecode(response.body);
  List<Establishment> list = [];

  jsonRes.forEach((establishment) {
    list.add(Establishment.fromJson(establishment, establishment['id']));
  });

  return response.statusCode == 200 ? list : Exception("Fail");
}

Future<void> createEstablishment({Establishment establishment}) async {
  http
      .post("$_baseUrl/establishment",
          body: jsonEncode({
            'name': establishment.name,
            'lat': establishment.lat,
            'lng': establishment.lng,
          }))
      .then((value) => value.statusCode);
}
