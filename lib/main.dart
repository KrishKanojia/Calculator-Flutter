import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String result;
  String operatortoperform;

  void btnClicked(String btnval) {
    if (btnval == "C") {
      firstnum = 0;
      secondnum = 0;
      result = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "x" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      result = "";
      operatortoperform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);

      if (operatortoperform == "+") {
        result = (firstnum + secondnum).toString();
      }

      if (operatortoperform == "-") {
        result = (firstnum - secondnum).toString();
      }

      if (operatortoperform == "x") {
        result = (firstnum * secondnum).toString();
      }

      if (operatortoperform == "/") {
        result = (firstnum / secondnum).toString();
      }
    } else {
      result = int.parse(texttodisplay + btnval).toString();
    }

    setState(
      () {
        texttodisplay = result;
      },
    );
  }

  Widget customButton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
