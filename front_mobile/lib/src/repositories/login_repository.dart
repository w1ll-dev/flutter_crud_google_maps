import 'dart:convert';

import "package:http/http.dart" as http;
import './server_config.dart';

final server = ServerConfig();

final _serverIp = server.serverIp;
final _serverPort = server.serverPort;
final _baseUrl = "http://$_serverIp:$_serverPort";

Future<String> login(String name, String password) async {
  final response = await http.post(
    "$_baseUrl/login",
    body: jsonEncode({
      'name': '$name',
      'password': '$password',
    }),
    headers: {
      "Content-Type": "application/json",
    },
  );

  Map<String, dynamic> jsonRes = jsonDecode(response.body);
  print(jsonRes);

  return jsonRes['token'];
}
