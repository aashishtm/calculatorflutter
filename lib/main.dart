import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum;
  int secondnum;
  String output="";
  String result;
  String oprtoperform;

  void btnclick(String clickvalue){
    if (clickvalue == "C"){
      firstnum = 0;
      secondnum = 0;
      result = "";
      output = "";
    }
    else if (clickvalue == "+" || clickvalue =="-" || clickvalue=="X" || clickvalue=="/"){
      firstnum = int.parse(output);
      result = "";
      oprtoperform = clickvalue;
    }
    else if (clickvalue == "="){
      secondnum = int.parse(output);
      if (oprtoperform == "+"){
        result = (firstnum + secondnum).toString();
      }
      if (oprtoperform == "-"){
        result = (firstnum - secondnum).toString();
      }
      if (oprtoperform == "X"){
        result = (firstnum * secondnum).toString();
      }
      if (oprtoperform == "/"){
        result = (firstnum ~/ secondnum).toString();
      }
    }
    else{
      result = int.parse(output + clickvalue).toString();
    }
    setState(() {
      output = result;
    });
  }

  Widget custombutton(String btnvalue){
    return Expanded(
      child: OutlineButton(
        onPressed:() => btnclick(btnvalue),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "$btnvalue",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$output',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("X"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
