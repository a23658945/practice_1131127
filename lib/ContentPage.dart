import 'dart:math';

import 'package:flutter/material.dart';
import 'BottomNav.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  TextEditingController _contentcontroller = TextEditingController();
  @override
  void dispose() {
    _contentcontroller.dispose();
    super.dispose();
  }

  @override
  void inState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Create a task"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.75,
              width: MediaQuery.sizeOf(context).width * 0.7,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(83, 92, 145, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(3, 3))
                  ]),
              child: Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("TITLE"), Text("Date")],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(195, 192, 197, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(3, 3))
                        ]),
                    child: TextField(
                      controller: _contentcontroller,
                      onSubmitted: (e) {
                        print(_contentcontroller.text);
                      },
                      decoration: InputDecoration(
                          hintText: " Write here", border: InputBorder.none),
                    ),
                  )
                ],
              )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ListPage');
                  },
                  child: Text("Save")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context, _contentcontroller.text); //返回上一頁
                  },
                  child: Text("Go front")),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: Bottomna(),
    );
  }
}
