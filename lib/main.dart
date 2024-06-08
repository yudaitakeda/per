import 'package:flutter/material.dart';
import 'working_log.dart'; //繋げたいファイルはここでインポートする

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetExample(), //アプリの初期画面として表示されるウィジェットを指定している
    );
  }
}

class WidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //この中に表示したいウィジェットを記述する
      appBar: AppBar(
        title: Text('ようこそ！筋トレアプリへ！'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // working.dartファイル内のHomePageウィジェットを表示
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('筋トレ状況を確認する！'),
        ),
      ),
    );
  }
}
