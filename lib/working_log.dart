import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポート
import 'package:table_calendar/table_calendar.dart'; // table_calendarパッケージをインポート
import 'main.dart'; // main.dartファイルをインポート

void main() {
  runApp(MyApp()); // アプリのエントリーポイント
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // HomePageウィジェットをアプリのホームとして設定
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(); // HomePageの状態を作成する
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month; // カレンダーの表示形式（初期値は月表示）
  DateTime _focusedDay = DateTime.now(); // 現在フォーカスされている日付（初期値は現在の日付）
  DateTime? _selectedDay; // ユーザーが選択した日付（初期値はnull）
  Map<DateTime, List<String>> _events = {}; // 日付ごとのイベントを保持するマップ

  final _textController = TextEditingController(); // テキストフィールドのコントローラ

  // イベントを追加するメソッド
  void _addEvent(String event) {
    if (_events[_selectedDay] == null) {
      _events[_selectedDay!] = [];
    }
    _events[_selectedDay]!.addAll(event.split('\n'));
    _textController.clear(); // テキストフィールドをクリア
    setState(() {}); // 状態を更新してUIをリフレッシュ
  }

  // イベントを削除するメソッド
  void _deleteEvent(String event) {
    _events[_selectedDay]!.remove(event);
    setState(() {}); // 状態を更新してUIをリフレッシュ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('筋トレ記録カレンダー'), // アプリバーのタイトルを設定
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1), // カレンダーの表示開始日
            lastDay: DateTime.utc(2030, 12, 31), // カレンダーの表示終了日
            focusedDay: _focusedDay, // 現在フォーカスされている日付
            calendarFormat: _calendarFormat, // カレンダーの表示形式
            selectedDayPredicate: (day) {
              return isSameDay(
                  _selectedDay, day); // 選択された日付とカレンダーの日付が一致するかどうかを判定
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay; // 選択された日付を更新
                _focusedDay = focusedDay; // フォーカスされた日付を更新
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format; // カレンダーの表示形式を更新
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay; // フォーカスされた日付を更新
            },
          ),
          const SizedBox(height: 8.0), // スペースを追加
          if (_selectedDay != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController, // テキストフィールドのコントローラを設定
                decoration: InputDecoration(
                  labelText: 'イベントを追加', // テキストフィールドのラベルを設定
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add), // アイコンを設定
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _addEvent(_textController.text); // テキストフィールドの内容をイベントに追加
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _events[_selectedDay]?.length ?? 0, // イベントの数を取得
                itemBuilder: (context, index) {
                  final event = _events[_selectedDay]![index];
                  return ListTile(
                    title: Text(event), // イベントの内容を表示
                    trailing: IconButton(
                      icon: Icon(Icons.delete), // 削除アイコンを表示
                      onPressed: () {
                        _deleteEvent(event); // イベントを削除
                      },
                    ),
                  );
                },
              ),
            ),
          ],
          ElevatedButton(
            onPressed: () {
              // working.dartファイル内のHomePageウィジェットを表示
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetExample()),
              );
            },
            child: Text('ホームに戻る'),
          ),
          Expanded(
            child: Center(
              child: Text(
                _selectedDay != null
                    ? 'Selected Day: ${_selectedDay!.toString().split(' ')[0]}' // 選択された日付を表示
                    : '日付が選択されていません', // 日付が選択されていない場合のメッセージ
                style: TextStyle(fontSize: 20), // テキストのスタイルを設定
              ),
            ),
          ),
        ],
      ),
    );
  }
}
