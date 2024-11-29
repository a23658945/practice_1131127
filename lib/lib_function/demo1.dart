import 'package:flutter/material.dart';
import 'Slider.dart';
import 'package:practice_1131127/exTextfield.dart';
import 'package:practice_1131127/BottomNav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Demo1()),
    );
  }
}

class Demo1 extends StatefulWidget {
  const Demo1({super.key});

  @override
  State<Demo1> createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  int count = 0;
  int count0 = 0;
  bool _check = false;

  Color checkedColor = Colors.yellow;

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
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
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
                      ),
                  ExTextfield1()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Slidering()
            ],
          ),
        ),bottomNavigationBar: Bottomna(),
        );
  }
}
