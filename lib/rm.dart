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
        title: const Text('RM換算'), //
      ),
      body: Column(
        //縦に並べる
        crossAxisAlignment: CrossAxisAlignment.start, //左寄せ
        children: const [
          //定数
          Padding(
            padding: EdgeInsets.all(8.0), //余白
            child: Text('RM換算を行う画面です'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), //余白
            child: TextField(
              decoration: InputDecoration(
                //入力フォームの装飾
                border: OutlineInputBorder(), // 枠線をつける
                labelText: '重量を入力してください',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), //余白
            child: TextField(
              decoration: InputDecoration(
                //入力フォームの装飾
                border: OutlineInputBorder(), // 枠線をつける
                labelText: '回数を入力してください',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0), //余白
            child: Text(
              'RM換算結果',
              style: TextStyle(
                fontSize: 20.0, //フォントサイズ
                fontWeight: FontWeight.bold, //太字
              ),
            ),
          ),
        ],
      ),
    );
  }
}
