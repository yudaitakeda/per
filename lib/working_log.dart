import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('workout log'),
      ),
      body: Center(
        child: Text('To keep a workout log'),
      ),
    );
  }
}
