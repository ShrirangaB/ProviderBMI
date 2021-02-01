import 'package:DemoStateMgmt/model/bmilog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class BMI_Calc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Calc(),
        ),
      ],
      child: MaterialApp(
        title: 'BMI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BMI(title: "BMI calculator"),
      ),
    );
  }
}

class BMI extends StatelessWidget {
  final myHeight = TextEditingController();
  final myWeight = TextEditingController();
  final String title;
  BMI({this.title});
  void _calculator(BuildContext context) {
    Provider.of<Calc>(context, listen: false)
        .CalculateBmi(double.parse(myHeight.text), double.parse(myWeight.text));
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Calc>(context).getCounter;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 320,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "weight in Kg",
                          ),
                          controller: myWeight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 320,
                        child: TextField(
                          decoration: InputDecoration(hintText: "Height in cm"),
                          controller: myHeight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: RaisedButton(
                          child: Text(
                            "Calculate",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _calculator(context);
                          },
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.only(
                            left: 115.0, top: 5.0, right: 25.0, bottom: 5.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        counter == null
                            ? "Enter Value"
                            : "${counter.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
