import 'package:DemoStateMgmt/model/counter.dart';
import 'package:DemoStateMgmt/screen/bmi.dart';

// import 'package:DemoStateMgmt/screen/homeP.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMI_Calc(),
    );
  }
}
