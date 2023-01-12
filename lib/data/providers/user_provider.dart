import 'package:latihan_bloc/bloc/export.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<Map<String, dynamic>> getDataUser() async {
    try {
      Uri url = Uri.parse("https://reqres.in/api/users");
      var response = await http.get(url);

      if (response.statusCode != 200) {
        return {
          "error": true,
          "message": "${response.statusCode}",
        };
      }
      Map<String, dynamic> body = jsonDecode(response.body);

      return {
        "error": false,
        "message": "Berhasil Get Data User",
        "data": UserModel.fromJson(body),
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
