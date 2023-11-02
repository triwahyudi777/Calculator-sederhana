import 'package:flutter/material.dart';
import 'dart:math'; // Import library untuk fungsi perpangkatan dan akar kuadrat.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCalculator(),
      ),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _output = "";
  String _currentInput = "";
  late double _num1, _num2;
  late String _operator;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "";
      _currentInput = "";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      if (_currentInput != "") {
        _num1 = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "";
      }
    } else if (buttonText == "=") {
      if (_currentInput != "") {
        _num2 = double.parse(_currentInput);
        if (_operator == "+") {
          _currentInput = (_num1 + _num2).toString();
        } else if (_operator == "-") {
          _currentInput = (_num1 - _num2).toString();
        } else if (_operator == "x") {
          _currentInput = (_num1 * _num2).toString();
        } else if (_operator == "/") {
          _currentInput = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      }
    } else if (buttonText == "x²") {
      if (_currentInput != "") {
        double num = double.parse(_currentInput);
        _currentInput = (num * num).toString();
      }
    } else if (buttonText == "√") {
      if (_currentInput != "") {
        double num = double.parse(_currentInput);
        _currentInput = sqrt(num).toString();
      }
    } else {
      _currentInput += buttonText;
    }

    setState(() {
      _output = _currentInput;
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(12.0),
          child: Text(
            _output,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("7"),
            _buildButton("8"),
            _buildButton("9"),
            _buildButton("/"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("4"),
            _buildButton("5"),
            _buildButton("6"),
            _buildButton("x"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("1"),
            _buildButton("2"),
            _buildButton("3"),
            _buildButton("-"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("C"),
            _buildButton("0"),
            _buildButton("="),
            _buildButton("+"),
            _buildButton("x²"), // Tombol perpangkatan
            _buildButton("√"),  // Tombol akar kuadrat
          ],
        ),
      ],
    );
  }
}