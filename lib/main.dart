import 'package:flutter/material.dart';
import 'lib_function/demo1.dart';
import 'exTextfield.dart';
import 'BottomNav.dart';
import 'ListPage.dart';

void main() {
  runApp(const MainApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: Color.fromARGB(255, 238, 241, 21))),
      initialRoute: '/',
      routes: {
        '/': (context) => Demo1(),
        '/ExTextfield1': (context) => Scaffold(
              appBar: AppBar(),              
              body: ExTextfield1(),
              
              bottomNavigationBar: Bottomna()
            ),
        '/ListPage': (context) => ListPage(),
      },
    );
  }
}
