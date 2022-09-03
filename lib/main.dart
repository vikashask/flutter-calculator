import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int firstNum = 0;
  int secondNum = 0;
  String textToDisplay = "";
  String res = "";
  String operatorToPerform = "";

  void btnClicked(String btnVal) {
    if (btnVal == "C") {
      textToDisplay = "";
      res = "";
      firstNum = 0;
      secondNum = 0;
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "+" ||
        btnVal == "/") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operatorToPerform = btnVal;
    } else if (btnVal == "=") {
      secondNum = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (operatorToPerform == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operatorToPerform == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (operatorToPerform == "/") {
        res = (firstNum / secondNum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
        child: OutlinedButton(
      onPressed: () => btnClicked(btnVal),
      child: Text(
        "$btnVal",
        style: TextStyle(fontSize: 25.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                "$textToDisplay",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
            )),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+")
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-")
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x")
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/")
              ],
            )
          ],
        ),
      ),
    );
  }
}
