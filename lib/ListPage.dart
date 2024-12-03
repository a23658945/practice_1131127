import 'package:flutter/material.dart';
import 'lib_function/taskList.dart';
import 'lib_function/TodoDate.dart';
import 'BottomNav.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<TodoDate> task = []; //TodoDate(content: "1234", checked: true),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Task List"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              color: Colors.red,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_note),
                color: Colors.grey)
          ]),
      body: task.isEmpty
          ? Center(
              child: Text(
                "請按下右下角，新增第一筆ToDo!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView(
              children: task
                  .map((e) => TaskList(
                        checked: e.checked,
                        content: e.content,
                        onCheckedChange: (bool? newValue) {
                          setState(() {
                            e.checked = newValue ?? false;
                          });
                        },
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/ContentPage');
          if (result != null && result != '') {
            setState(() {
              task.add(TodoDate(checked: false, content: result.toString()));
            });
          } else {
            setState(() {
              task.add(TodoDate(checked: false, content: "請重新輸入"));
            });
          }

          for (int i = 0; i < task.length; i++) {
            print(task[i].content);
          }
        },
        child: Icon(Icons.edit_document),
      ),
      bottomNavigationBar: Bottomna(),
    );
  }
}
