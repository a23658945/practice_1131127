import 'package:flutter/material.dart';

class ExTextfield1 extends StatefulWidget {
  const ExTextfield1({super.key});

  @override
  State<ExTextfield1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExTextfield1> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;
  String text = '';
  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        child: TextField(
          controller: _controller,
          style: const TextStyle(color: Colors.blue),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'username',
            labelStyle: TextStyle(color:Colors.blueGrey)
          ),
          onEditingComplete: () {
            print('onEditingComplete');
          },
          onChanged: (v) {
            print('onChanged:' + v);
          },
          onSubmitted: (e) {
            setState(() {
              text = _controller.text;
            });
            
            _controller.clear();
          },
        )
        );
  }
}
