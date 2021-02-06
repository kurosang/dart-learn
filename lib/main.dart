import 'package:flutter/material.dart';
import 'package:my_app/function_learn.dart';
import 'package:my_app/oop_learn.dart';

import 'data_type.dart';
import 'generic_learn.dart';

/// 入口方法就是我们的runApp方法
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dart基础',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Dart基础'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // _oopLearn();
    //_functionLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[
            // DataType()
          ],
        )
      ),
    );
  }
  void _oopLearn(){
    print('-----_oopLearn------');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log2 == log1);

    Student.doPrint('_oopLearn');
    /// 创建Student的对象
    Student stu1 = Student('清华', 'jack', 18);
    stu1.school = '985';
    print(stu1.toString());
    
    Student stu2 = Student('北大', 'kuro', 15,city:'上海',country: '中国');
    print(stu2.toString());

    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn(){
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }
  void _genericLearn(){
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }

}
