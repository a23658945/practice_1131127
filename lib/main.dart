import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MyWidget()),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int count = 0;
  int count0 = 0;
  bool _check = false;
  double _value = 0.0;
  
  Color checkedColor = Colors.yellow;

  void _onChange(e){
    setState(() {
      _value = e;
    });  
  }

  void increase() {
    if (count0 >= 25) {
      count0 = 0;
      checkedColor = Colors.red;
    } else if (count0 > 15) {
      count0 += 2;
      _check = true;
      checkedColor = Colors.orange;
    } else {
      count0 += 3;
      _check = false;
      checkedColor = Colors.purple;
    }    
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello World! + $count",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  //setState重新喧染函示
                  count += 1;
                  if (count == 10) {
                    count = 0;
                  }
                });
              },
              child: Text("按我+1 count=$count")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() => increase());
              },
              child: Text("按我+1 count0=$count0")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _check,
                onChanged: (bool? value) =>
                    setState(() => _check = value ?? false),
                checkColor: Colors.white,
                activeColor: checkedColor,
              ),
              Container(
                  width: 100,
                  child: _check
                      ? Image.asset(
                          "assets/light-bulb_close_0.png") //_check bool為false
                      : Image.asset(
                          "assets/light-bulb_open_0.png") //_check bool為true
                  )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: _value,
            color: Colors.red,
          ),
          Text('當前值:${_value.toStringAsFixed(1)}'
          ),
          Slider(
            value: _value,
            min: 0.0,
            max: 360.0,
            activeColor: Colors.orangeAccent,
            inactiveColor: Colors.green.withAlpha(99),
            onChanged: _onChange),
        ],
      ),
    );
  }
}

