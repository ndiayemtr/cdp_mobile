import 'dart:convert';
import 'package:cdp_mobile/models/plainte.dart';
import 'package:http/http.dart' as http;

//https://www.youtube.com/watch?v=F4Q6lEhmwCY&ab_channel=MobileProgrammer

class SerivesBdd {
  static const ROOT = 'http://localhost/cdp_mobile_bdd/plainte_action.php';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const GET_ALL_ACTION = 'GET_ALL';
  static const ADD_PLAINTE_ACTION = 'ADD_PLAINTE';
  static const UPDATE_PLAINTE_ACTION = 'UPDATE_PLAINTE';
  static const DELETE_PLAINTE_ACTION = 'DELETE_PLAINTE';

  static Future<String> createTable() async {
    try {
      final Uri url = Uri.parse(ROOT);
      var map = Map<String, dynamic>();
      map['action'] = CREATE_TABLE_ACTION;
      final response = await http.post(url, body: map);
      print('create table Response: ${response.body}');
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  /* static Future<List<Plainte>> getPliantes() async {
    try {
      final Uri url = Uri.parse(ROOT);
      var map = Map<String, dynamic>();
      map['action'] = GET_ALL_ACTION;
      final response = await http.post(url, body: map);
      print('create table Response: ${response.body}');

      if (200 == response.statusCode) {
        List<Plainte> list = parseResponse(response.body);
        return list;
      }
    } catch (e) {
      print(e);
    }
  } */

  static List<Plainte> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Plainte>((json) => Plainte.fromJson(json)).toList();
  }

  static Future<String> addPalinte(
      String prenom, String nom, String message_plainte) async {
    try {
      final Uri url = Uri.parse(ROOT);
      var map = Map<String, dynamic>();
      map['action'] = ADD_PLAINTE_ACTION;
      map['prenom'] = prenom;
      map['nom'] = nom;
      map['message_plainiant'] = message_plainte;

      final response = await http.post(url, body: map);

      print('addPalinte Response: ${response.body}');

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}
