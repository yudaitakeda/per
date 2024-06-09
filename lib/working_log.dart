import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// HomePageクラスはStatefulWidgetを拡張しています。
// StatefulWidgetはウィジェットが変更可能な状態を持つことを意味します。
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month; // カレンダーの表示形式（初期値は月表示）
  DateTime _focusedDay = DateTime.now(); // 現在フォーカスされている日付（初期値は現在の日付）
  DateTime? _selectedDay; // ユーザーが選択した日付（初期値はnull）

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
              // 選択された日付とカレンダーの日付が一致するかどうかを判定
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              // 日付が選択されたときの処理
              setState(() {
                _selectedDay = selectedDay; // 選択された日付を更新
                _focusedDay = focusedDay; // フォーカスされた日付を更新
              });
            },
            onFormatChanged: (format) {
              // カレンダーの表示形式が変更されたときの処理
              setState(() {
                _calendarFormat = format; // カレンダーの表示形式を更新
              });
            },
            onPageChanged: (focusedDay) {
              // カレンダーのページが変更されたときの処理
              _focusedDay = focusedDay; // フォーカスされた日付を更新
            },
          ),
          const SizedBox(height: 8.0), // スペースを追加
          Expanded(
            child: Center(
              child: Text(
                _selectedDay != null
                    // 選択された日付があればその日付を表示し、なければ「No Day Selected」と表示
                    ? 'Selected Day: ${_selectedDay!.toString().split(' ')[0]}'
                    : '日付が選択されていません',
                //選択された日にちのメモを表示させたい
                style: TextStyle(fontSize: 20), // テキストのスタイルを設定
              ),
            ),
          ),
        ],
      ),
    );
  }
}
