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
    };
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
            Checkbox(value: _check, onChanged: (bool? value) => setState(() => _check = value??false),checkColor: Colors.white, activeColor: checkedColor,)
          ],
        ),
      );
    }
  }

