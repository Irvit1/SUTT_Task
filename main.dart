import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tip Calculator',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Tip Calculator'),
            ),
            body: Center(
                child: Column(children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(labelText: "Enter the Amount"),
              ),
              ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Page2(value: myController.text)),
                    );
                  })
            ]
                )
            )
        )
    );
  }
}

class Page2 extends StatefulWidget {
  final String value;
  Page2({Key key, this.value}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var tipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page2"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text('Amount:' + "${widget.value}"),
          TextField(
            controller: tipController,
            decoration: InputDecoration(labelText: "Enter the Tip Percentage"),
          ),
          ElevatedButton (
              child: Text('Calculate'),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Tip Calculator"),
                      content: Text ("Amount:"+"${widget.value}"),


                      actions: <Widget> [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("Back"),
                        ),
                      ],
                        ),
                        );
                }
                )
                ]
    ),

                ),
            );
  }
}
