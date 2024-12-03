import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key, required this.checked, required this.content,required this.onCheckedChange});
  bool checked;
  String content;
  final Function(bool?) onCheckedChange;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext content) {
   
    return ListTile(
        leading: Checkbox(
          value: widget.checked ,onChanged: widget.onCheckedChange
          ),
        title: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // 陰影顏色與透明度
                  spreadRadius: 2, // 擴散半徑
                  blurRadius: 5, // 模糊半徑
                  offset: Offset(3, 3), // 陰影位移 (x, y)
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("${widget.content}"),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite),color: Colors.red,),
                SizedBox(
                  width: 1,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit_note))
              ],
            )));
  }
}
