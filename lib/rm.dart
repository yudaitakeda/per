import 'package:flutter/material.dart';

// StatefulWidgetを継承するクラスを定義
class Rmstate extends StatefulWidget {
  const Rmstate({Key? key}) : super(key: key);

  // createStateメソッドを実装して、Stateオブジェクトを返す
  @override
  _RmState createState() => _RmState();
}

// Stateクラスを定義
class _RmState extends State<Rmstate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RM換算'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('RM換算画面です'),
          ),
        ],
      ),
    );
  }
}
