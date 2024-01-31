import 'package:flutter/material.dart';
import 'package:seruapp/view/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}
