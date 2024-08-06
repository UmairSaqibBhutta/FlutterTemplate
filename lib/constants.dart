import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/size_config.dart';

double getHeight(context) => MediaQuery.of(context).size.height;

double getWidth(context) => MediaQuery.of(context).size.width;

bool isEnglish = true;

const String baseUrl = "https://hihello-production.up.railway.app/api/";

const headingStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  // height: 1.5,
);

const smallheadingStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  // height: 1.5,
);

const boldStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

Text boldText(String text) {
  return Text(
    text,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
}

Widget titleWidget(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Center(child: Text(text, style: smallheadingStyle)),
  );
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

Row formErrorText({required String error}) {
  return Row(
    children: [
      SvgPicture.asset(
        "assets/Error.svg",
        height: getProportionateScreenWidth(12),
        width: getProportionateScreenWidth(12),
      ),
      SizedBox(
        width: getProportionateScreenWidth(10),
      ),
      Text(error),
    ],
  );
}
