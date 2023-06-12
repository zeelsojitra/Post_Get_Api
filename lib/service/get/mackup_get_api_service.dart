import 'dart:convert';

import '../../model/get/mackup_get_api_model.dart';

import 'package:http/http.dart' as http;

class GetMakupService {
  static Future<List<MackupModel>?> GetMackupModel() async {
    http.Response response = await http.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    print("Response ==${jsonDecode(response.body)}");
    return mackupModelFromJson(response.body);
  }
}
