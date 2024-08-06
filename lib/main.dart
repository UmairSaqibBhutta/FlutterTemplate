import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/home.dart';
import 'package:flutter_template/login.dart';
import 'package:flutter_template/login_storage.dart';
import 'package:flutter_template/services/custom_get_request.dart';
import 'package:flutter_template/services/custom_post_request.dart';
import 'package:flutter_template/size_config.dart';
import 'package:flutter_template/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

late CustomGetRequest getRequest;
late CustomPostRequest postRequest;
late LoginStorage loginStorage;
late Logger logger;
Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('login_hive');
  loginStorage = LoginStorage();

  getRequest = CustomGetRequest();
  postRequest = CustomPostRequest();
  logger = Logger();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().initSizeConfig(context);

    return MaterialApp(
      theme: theme(),
      home: getFirstPage(),
    );
  }

  getFirstPage() {
    if (loginStorage.getUserId() == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }
}
