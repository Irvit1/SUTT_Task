import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// Define a custom Form widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyAppState extends State<MyApp> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  var myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
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
              child: Column(
                children:[
              
              TextField(
                controller: myController,
                decoration: InputDecoration(
                labelText: "Enter the Amount"),
              ),
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page2(value: myController.text)),
                  );
                }
            )
                        ]
      
            )
        )
    )
    );
  }
}

class Page2 extends StatefulWidget {
  final String value;
  Page2({Key key, this.value}) : super (key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page2"),
        ),
        body: Center(
            child: Column(
                children:<Widget> [
                  Text("${widget.value}"),
                ]
            )


        )
    );
  }
}

