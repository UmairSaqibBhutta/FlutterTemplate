import 'dart:convert';
import 'dart:developer';
import 'package:flutter_template/constants.dart';
import 'package:http/http.dart' as http;

class CustomGetRequest {
  Future httpGetRequest({required String url}) async {
    final uri = baseUrl + url;
    try {
      log("Get Request Url $uri");
      var headers = {
        "Content-Type": "application/json",
        // "accept": "application/json",
      };
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: headers,
      );
      log("Get Request status code ${response.statusCode}");
      log("Get Request Body of url $url ====  ${response.body}");
      Map jsonn = jsonDecode(response.body);

      // Map jsonDecoded = json.decode(response.body);
      // log("jsonDecoded = $jsonDecoded");
      return jsonn;
    } catch (err) {
      log(err.toString());

      return null;
    }
  }
}
