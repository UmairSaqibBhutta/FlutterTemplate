import 'dart:convert';
import 'dart:developer';
import 'package:flutter_template/constants.dart';
import 'package:http/http.dart' as http;

class CustomPostRequest {
  static CustomPostRequest? customPostRequest; // Singleton instance

  factory CustomPostRequest() {
    customPostRequest ??= CustomPostRequest._internal();
    return customPostRequest!;
  }

  CustomPostRequest._internal(); // Private constructor

  Future httpPostRequest({required String url, required Map body}) async {
    final uri = baseUrl + url;

    log("body = $body");

    try {
      log("Post Request Url $uri");
      var headers = {
        "Content-Type": "application/json",
        // "accept": "application/json",
      };
      http.Response response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: json.encode(body),
      );
      log("Post Request status code ${response.statusCode}");
      log("Post Request Body ${response.body}");
      Map jsonn = jsonDecode(response.body);

      return jsonn;
    } catch (err) {
      log(err.toString());

      return null;
    }
  }
}
