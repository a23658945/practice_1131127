import 'package:flutter/material.dart';

class Slidering extends StatefulWidget {
  const Slidering({super.key});

  @override
  State<Slidering> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Slidering> {
double _value = 0.0;

void _onChange(e){
    setState(() {_value = e;});  
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: _value,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            '當前值: ${_value.toStringAsFixed(1)}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Slider(
          value: _value,
          min: 0.0,
          max: 360.0,
          activeColor: Colors.orangeAccent,
          inactiveColor: Colors.green.withAlpha(99),
          onChanged: _onChange,
        ),
      ],
    );
  }
}











