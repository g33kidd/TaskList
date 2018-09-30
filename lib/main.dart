import 'package:flutter/material.dart';

void main() => runApp(new TaskListApp());

class TaskListApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Task {
  String title = "Task title";
  String note = "This is a note of task";

  // This should probably be an actual dateTime later on.
  int day = 0;
  bool completed = false;

  Task({this.title, this.completed, this.note, this.day});
}

class Day {
  String title = "";
  int index = 0;
  Day({this.title, this.index});
}

class _MyHomePageState extends State<MyHomePage> {
  List<Day> days = [
    Day(title: "M", index: 0),
    Day(title: "T", index: 1),
    Day(title: "W", index: 2),
    Day(title: "T", index: 3),
    Day(title: "F", index: 4),
  ];

  List<Task> tasks = [
    Task(title: "Hello world", note: "This is a note of hello world!", day: 0),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 1),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 1),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 0),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 3),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 2),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 4),
    Task(title: "Hello world", note: "This is a note of hello world!", day: 0),
  ];

  Widget _buildDay(BuildContext context, Day day) {
    TextStyle _dayTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 50.0,
      fontWeight: FontWeight.w300,
    );

    TextStyle _dayTasksTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 25.0,
      fontWeight: FontWeight.w300,
    );

    int taskAmount = tasks.where((task) => task.day == day.index).length;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(day.title, style: _dayTextStyle),
            ),
            Expanded(flex: 1, child: Container()),
            Align(
              alignment: Alignment.centerRight,
              child: Text("$taskAmount", style: _dayTasksTextStyle),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDays(BuildContext context) {
    List<Widget> widgets = [];
    days.forEach((d) {
      widgets.add(_buildDay(context, d));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildDays(context),
          ),
        ),
      ),
    );
  }
}
