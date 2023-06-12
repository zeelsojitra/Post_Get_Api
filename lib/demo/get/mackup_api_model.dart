import 'dart:convert';

import '../../model/get/mackup_get_api_model.dart';
import 'package:http/http.dart' as http;

class GetMackup {
  static Future<List<MackupModel?>?> GetmackupApi() async {
    http.Response response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    print("Responcee==>${jsonDecode(response.body)}");
    return mackupModelFromJson(response.body);
  }
}
