import 'package:flutter/material.dart';

class TrainingRecordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TrainingRecordScreen()),
        );
      },
      child: Text('今日のトレーニングを記録する'),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white), // ボタンのテキスト色
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class TrainingRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('トレーニング記録'),
      ),
      body: Center(
        child: Text('トレーニング記録画面'),
      ),
    );
  }
}
