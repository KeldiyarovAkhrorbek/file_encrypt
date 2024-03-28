import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/result-page';

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Natija'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            "Fayl shifrlandi, iltimos, dastur\npapkasini ichidan download\nfolderni tekshiring!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
