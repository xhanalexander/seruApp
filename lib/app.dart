import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seruapp/view/form_view.dart';
import 'package:seruapp/view_models/wilayah_view_models.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WilayahViewModels()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MainForm(),
      ),
    );
  }
}