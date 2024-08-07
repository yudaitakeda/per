import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // 生成された firebase_options.dart をインポート
import 'working_log.dart'; // 繋げたいファイル
import 'rm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter の初期化を待つ
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase の設定オプション
  );
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
      home: WidgetExample(), // アプリの初期画面として表示されるウィジェットを指定している
    );
  }
}

class WidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // この中に表示したいウィジェットを記述する
      appBar: AppBar(
        title: Text('筋トレ管理アプリ(仮)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
          children: [
            ElevatedButton(
              onPressed: () {
                // working_log.dartファイル内のHomePageウィジェットを表示
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rmstate()),
                );
              },
              child: Text('目標記入'),
            ),
            ElevatedButton(
              onPressed: () {
                // rm.dartファイル内のRmstateウィジェットを表示
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rmstate()),
                );
              },
              child: Text('RM換算'),
            ),
            ElevatedButton(
              onPressed: () {
                // working_log.dartファイル内のHomePageウィジェットを表示
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('筋トレ状況の確認'),
            ),
          ],
        ),
      ),
    );
  }
}
