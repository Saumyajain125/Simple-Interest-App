import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  String Intrest = 'simple';
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
  int _counter = 0;
  int selectedRadioTile;
  TextEditingController principal = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController time = TextEditingController();
  String fina = "";
  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      backgroundColor: Colors.blue,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.black54,
        title: Text("Interest Calculator"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              //First Column here we will have an image
              //getImage(),
              RadioListTile(
                tileColor: Colors.grey,
                value: 1,
                groupValue: selectedRadioTile,
                title: Text("Simple Interest",style: TextStyle(color: Colors.white),),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                  setSelectedRadioTile(val);
                },
                activeColor: Colors.red,
                selected: true,
              ),
              RadioListTile(
                value: 2,
                groupValue: selectedRadioTile,
                title: Text("Compound Interest",style: TextStyle(color: Colors.white),),
                onChanged: (val) {
                  print("Radio Tile pressed $val");
                  setSelectedRadioTile(val);
                },
                activeColor: Colors.red,
                selected: false,
              ),
              // 3 textFields
              Padding(
                padding: const EdgeInsets.only(top:12.0,left: 8.0,right: 8.0,bottom: 8.0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Textfield(principal,"Amount"),
                    Textfield(rate,"Rate of Interest"),
                    Textfield(time,"Time"),
                  ],
                ),
              ),
              // Button to Calculate
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    height: 80,
                    width: 300,

                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Center(child: Text("CALCUALTE",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  onTap: () {
                    final snackBar = SnackBar(content: Text(Setvalue()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ],
              ),
          ),
      ),
    );
  }
  String Setvalue(){
    String answer = "";
    double p = double.parse(principal.text);
    double r = double.parse(rate.text);
    double t = double.parse(time.text);

    double netpayableamount = 0;
    if(selectedRadioTile == 1){
      netpayableamount = p+(p*r*t)/100;
    }
    else if(selectedRadioTile == 2){
      netpayableamount = p + pow((1+(r/100)),t);
    }
    if(t == 1){
      answer = "Interst in $t time would be $netpayableamount at rate of $r";
    }
    else{
      answer = "Interst in $t time would be $netpayableamount at rate of $r";
    }
    print(answer);
    return answer;
  }
  TextField Textfield(cont,str) {
    return TextField(
              cursorColor: Colors.white,
              controller: cont,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: str,
                border: const OutlineInputBorder(

              )
              ),
            );
  }

  Container getImage() {
    return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/pic1.jpg'),
              )
            ),
          );
  }
}
