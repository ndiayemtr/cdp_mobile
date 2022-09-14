import 'dart:convert';

import 'package:http/http.dart' as http;

class APi {
  static addSignalement(Map data) async {
    final response = await http
        .post(Uri.parse(Url.addSignalement), body: {'data': jsonEncode(data)});

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        //var result = jsonDecode(response.body);
        if (result[0]) {
          return result;
        } else {
          return null;
        }
      }
    } else {
      return null;
    }
  }
}

class Url {
  static String addSignalement =
      "https://cdpmobile.000webhostapp.com/mobile/signalement.php";
}
