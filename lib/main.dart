import 'package:file_encrypt/pages/choose_file_page.dart';
import 'package:file_encrypt/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ChooseFilePage(),
      routes: {
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
