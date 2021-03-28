
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CIS 3334 Tip Calculator'),
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

  final billAmountTextField = TextEditingController();
  bool isSwitched = false;
  double _bill = 0;
  double _tip = 0;
  String tipString = "";

  calculateTip(){
    _bill = double.parse(billAmountTextField.text);
    if(isSwitched){
      _tip = _bill * 0.20;
    }

    _tip = _bill * 0.15;
    tipString = _tip.toString();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tip Calculator',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Bill Amount:'
            ),
            TextField(
              controller: billAmountTextField,
            ),
            Text(
              'Great Service?'
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.yellow,
              activeColor: Colors.orangeAccent,
            ),
            ElevatedButton(
                onPressed: calculateTip,
                child: Text('Calculate Tip')),
            Text(
              'Total Tip:' + tipString
            ),
          ],
        ),
      ),
    );
  }
}
