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
  // TextEditingControllerを定義（重量入力用）
  final TextEditingController _weightController = TextEditingController();
  // TextEditingControllerを定義（回数入力用）
  final TextEditingController _repsController = TextEditingController();

  // 計算結果を保持する変数
  double? _result1;
  double? _result5;
  double? _result10;
  // ボタンが押されたときの処理
  void _calculate() {
    // 重量の入力を取得し、数値に変換。無効な場合は0を使用
    final double weight = double.tryParse(_weightController.text) ?? 0;
    // 回数の入力を取得し、数値に変換。無効な場合は0を使用
    final int reps = int.tryParse(_repsController.text) ?? 0;
    // 計算結果をセット
    setState(() {
      _result1 = weight * reps / 40 + weight;
      _result5 = 0.85 * (weight * reps / 40 + weight);
      _result10 = 0.75 * (weight * reps / 40 + weight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを定義し、タイトルを設定
      appBar: AppBar(
        title: const Text('RM換算'),
      ),
      // BodyにColumnを使用してウィジェットを縦に並べる
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 説明テキスト
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'RM換算を行う画面です\nRMとは最大可能反復回数を表します。1回持ち上げるのが限界の負荷を1RM、なんとか5回繰り返せる負荷を5RMというように表します。'),
          ),
          // 重量入力フィールド
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'weight(kg)を入力してください',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          // 回数入力フィールド
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _repsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'rep数を入力してください',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          // 計算ボタン
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _calculate,
              child: const Text('計算する'),
            ),
          ),
          // 計算結果の表示
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '1RM = ${_result1 != null ? _result1.toString() : ''}kg',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '5RM = ${_result5 != null ? _result5.toString() : ''}kg',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '10RM = ${_result10 != null ? _result10.toString() : ''}kg',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
