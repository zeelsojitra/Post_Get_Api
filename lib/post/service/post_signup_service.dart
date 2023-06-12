import 'dart:convert';

import 'package:http/http.dart' as http;

class SingUpService {
  static Future<String?> singup({required Map<String, dynamic> reqbody}) async {
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/user/create"),
        body: reqbody,
        headers: {
          "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
          "Client-Service": "frontend-client",
          "User-ID": "1",
          "Auth-Key": "simplerestapi",
          "Content-Type": "application/x-www-form-urlencoded",
        });
    var Resualt = jsonDecode(response.body);
    print("Responcee==>${jsonDecode(response.body)}");
    return Resualt['message'];
  }
}
