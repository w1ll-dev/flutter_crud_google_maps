import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/establishment_model.dart';
import "package:http/http.dart" as http;
import './server_config.dart';

final server = ServerConfig();

final _serverIp = server.serverIp;
final _serverPort = server.serverPort;
final _baseUrl = "http://$_serverIp:$_serverPort";

getTokenFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('token');
  return stringValue;
}

Future<List<Establishment>> getEstablishments() async {
  final _userToken = await getTokenFromSF();
  final response = await http.get(
    "$_baseUrl/establishments",
    headers: {
      "x-access-token": "$_userToken",
      "Content-Type": "application/json"
    },
  );
  print(response.body);
  List<dynamic> jsonRes = jsonDecode(response.body);
  List<Establishment> list = [];

  jsonRes.forEach((establishment) {
    list.add(Establishment.fromJson(establishment));
  });

  return response.statusCode == 200 ? list : Exception("Fail");
}

Future<void> createEstablishment({Establishment establishment}) async {
  final _userToken = await getTokenFromSF();
  http.post("$_baseUrl/establishments",
      body: jsonEncode({
        'name': establishment.name,
        'lat': establishment.lat,
        'lng': establishment.lng,
      }),
      headers: {
        "x-access-token": "$_userToken",
        "Content-Type": "application/json"
      }).then((value) => value.statusCode);
}

Future<void> updateEstablishment({Establishment establishment}) async {
  final _userToken = await getTokenFromSF();
  http.put("$_baseUrl/establishments/${establishment.id}",
      body: jsonEncode({
        'name': establishment.name,
        'lat': establishment.lat,
        'lng': establishment.lng,
      }),
      headers: {
        "x-access-token": "$_userToken",
        "Content-Type": "application/json"
      }).then((value) => value.statusCode);
}

Future<void> deleteEstablishment({int id}) async {
  final _userToken = await getTokenFromSF();
  http.delete("$_baseUrl/establishments/$id", headers: {
    "x-access-token": "$_userToken",
    "Content-Type": "application/json"
  }).then((value) => value.statusCode);
}
