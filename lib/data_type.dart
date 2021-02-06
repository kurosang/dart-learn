

import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // alt+回车快速创建方法
    // _numType();
    // _stringType();
    // _boolType();
    // _listType();
    // _mapType();
    _tips();
    return Container(child: Text('常用数据类型，请查看控制台输出'),);
  }
  /// 数字类型
  void _numType() {
    num num1 = -1.0; //是数字类型的父类
    num num2 = 2; //是数字类型的父类
    int int1 = 3; //只能是整数
    double d1 = 1.68; //双精度
    print("num:$num1 num:$num2 int:$int1 double:$d1");

    //常用api
    print(num1.abs()); //求绝对值
    print(num1.toInt()); // 转换成int
    print(num1.toDouble()); // 转换成double
  }
  /// 字符串
  _stringType(){
    String str1 = '字符串',str2="双引号";// 字符串的定义
    String str3 = 'str1:$str1 str2:$str2'; // 字符串拼接
    String str4 = 'str1:'+str1+' str2:'+str2; // 字符串拼接
    String str5 = '常用数据类型，请查看控制台输出';
    print(str3);
    print(str4);
    //常用api
    print(str5.substring(1,5));
    print(str5.indexOf('类型')); // 获取指定字符串位置
    print(str5.startsWith('常用'));// 判断字符串开头是不是指定字符串，是返回true，否则false
    print(str5.replaceAll("常用", "不常用")); // 替换字符串中匹配的字符
    print(str5.contains('类型')); // 判断字符串包不包含指定字符串
    print(str5.split('，')); // 以指定字符串为准 切割字符串为 数组
  }

  ///布尔类型。Dart是强bool类型检查，只有bool类型的值是true才被认为是true
  _boolType(){
    bool success = true,fail=false;
    print(success);
    print(fail);
    print(success || fail); // true
    print(success && fail); // false
  }

  ///List集合
  _listType(){
    print('--------_listType-------');
    /// 集合初始的方式
    List list = [1,2,3,'集合'];//初始化时添加元素
    print(list);
    List<int>list2 = [];
    // list2 = list; // 错误做法，类型转换错误

    /// 常用api
    List list3 = [];
    list3.add("list3"); // 通过add方法添加元素
    list3.addAll(list); // 合并两个数组
    list3.insert(2,"asdas");// 在指定索引处插入一个值
    list3.insertAll(2,list);// 在指定索引处插入一个数组
    print(list3);
    List list4 = List.generate(3, (index) => index*2); //集合的生成函数
    print(list4);// [0, 2, 4]

    List list5 = [1,2,3,'集合',2,3,4,5,6];
    list5.removeAt(2); // Dart 删除数组中指定索引位置的元素，用 removeAt() 方法，该方法返回被删除的对象，参数为 int 类型，代表索引值。
    list5.remove(1);// 删除指定元素
    list5.removeLast(); // 删除数组的最后一个元素
    list5.removeWhere((element) => element == '2');// 根据指定条件删除元素
    list5.removeRange(1,5);// 删除指定索引范围内的元素(含头不含尾)

    List<int> l1 = [8, 12, 4, 1, 17, 33, 10];
    List<int> l2 = l1.sublist(5); // 从指定索引处截取数组
    print(l2); // [33, 10]

    print(list.indexOf("集合")); // 获取指定元素在数组中的索引

    ///遍历
    for(int i = 0;i<list.length;i++){
      print(list[i]);
    }
    for(var o in list){
      print(o);
    }
    list.forEach((val) {
      print(val);
    });
  }

  ///Map类型 是将key和value相关联的对象，key和value都可以是任何类型的对象，并且key是唯一的。
  ///如果key重复，后面添加的key会替换前面的
  _mapType(){
    print('--------_mapType-------');

    /// 初始化
    Map names = {'xiaoming':'小明','xiaohong':'小红'};
    print(names);
    Map ages={};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    /// Map遍历
    ages.forEach((key, value) {
      print('$key,$value');
    });
    Map ages2 = ages.map((key, value){
      // 迭代生成一个新Map
      return MapEntry(value,key);
    });
    print(ages2);

    for(var key in ages.keys){
      /// 大括号 - 可以调用方法
      print('$key ${ages[key]}');
    }

    print(ages.values); //values 数组

    ages.remove('xiaoming'); // 删除某个key value
    print(ages); //

    print(ages.containsKey('xiaohong')); // 是否包含某个key
  }

  /// dynamic var Object 区别
  /// dynamic: 是所有Dart对象的基础类型，在大多数情况下，通常不直接使用它，
  /// 通过它定义的变量会关闭类型检查，这意味着dynamic x = 'hal';x.foo();
  /// 这段代码静态类型检查不会报错，但是运行时会crash。因为x并没有foo()方法，所以不建议使用
  /// var: 是一个关键字，意思是"我不关心这里的类型是什么。"，系统会自动推断类型runtimeType
  /// Object: 是Dart对象的基类，当你定义：Object o=xxx; 时，这时系统会认为o是个对象，你可以调用Object的api
  /// 因为Object提供了这些方法，但是如果你尝试调用o.foo()时，静态类型检查会进行报错；
  /// 综上不难看出dynamic与Object的最大区别是在静态类型检查上
  _tips(){
    /// dynamic 动态数据类型，只有代码运行之后才知道具体类型
    /// 用这个关键字可以定义任何类型，但由于dart是静态类型检测，所以用这个相当于失效了
    dynamic x = 'hal'; //
    print(x.runtimeType);
    print(x);
    // x.foo(); //比如这里foo这个方法是没有的，但由于用了dynamic，所以没有提示，得运行才知道错误。

    x = 123;
    print(x.runtimeType);
    print(x);

    /// var 只是一个关键字，不是动态数据类型
    var a = 'var'; // 当我们初始化就已经知道a是string类型了
    print(a.runtimeType);
    print(a);

    // a=123;//报错，类型不一致
    // a='dead' // true

    ///Object dart的对象的基类
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
  }
}
