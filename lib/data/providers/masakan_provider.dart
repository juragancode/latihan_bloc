import 'package:latihan_bloc/bloc/export.dart';
import 'package:http/http.dart' as http;

class MasakanProvider {
  Future<Map<String, dynamic>> getDataMasakan() async {
    try {
      Uri url = Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php");
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
        "message": "Berhasil Get Data Masakan",
        "data": MasakanModel.fromJson(body),
      };
    } catch (e) {
      return {
        "error": true,
        "message": "$e",
      };
    }
  }
}
