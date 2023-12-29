import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: const Text('Aman Calculator'),
      ),
      body: Container(
        color: Colors.pink[100],
        padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(

                color: Colors.pink[300],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.only(right: 12.0),
              margin: const EdgeInsets.all(16.0),

              alignment: Alignment.centerRight,
              child: Text(
                _input,
                style: const TextStyle(fontSize: 68.0, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    text: '7', onPressed: () => _onButtonPressed('7')),
                CalculatorButton(
                    text: '8', onPressed: () => _onButtonPressed('8')),
                CalculatorButton(
                    text: '9', onPressed: () => _onButtonPressed('9')),
                CalculatorButton(
                    text: '/', onPressed: () => _onButtonPressed('/')),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    text: '4', onPressed: () => _onButtonPressed('4')),
                CalculatorButton(
                    text: '5', onPressed: () => _onButtonPressed('5')),
                CalculatorButton(
                    text: '6', onPressed: () => _onButtonPressed('6')),
                CalculatorButton(
                    text: '*', onPressed: () => _onButtonPressed('*')),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    text: '1', onPressed: () => _onButtonPressed('1')),
                CalculatorButton(
                    text: '2', onPressed: () => _onButtonPressed('2')),
                CalculatorButton(
                    text: '3', onPressed: () => _onButtonPressed('3')),
                CalculatorButton(
                    text: '-', onPressed: () => _onButtonPressed('-')),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                    text: 'C', onPressed: () => _onButtonPressed('C')),
                CalculatorButton(
                    text: '0', onPressed: () => _onButtonPressed('0')),
                CalculatorButton(
                    text: '=', onPressed: () => _onButtonPressed('=')),
                CalculatorButton(
                    text: '+', onPressed: () => _onButtonPressed('+')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '0';
      } else if (buttonText == '=') {
        _input = _calculateResult();
      } else {
        _input = (_input == '0') ? buttonText : '$_input$buttonText';
      }
    });
  }

  String _calculateResult() {
    String expression = _input;

    try {
      // Using the 'dart:math' library to evaluate the expression
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, contextModel);

      // Check if the result is an integer, and display accordingly
      if (result == result.toInt()) {
        return result.toInt().toString();
      } else {
        return result.toString();
      }
    } catch (e) {
      // Handle any potential errors during expression evaluation
      return 'Not Defined';
    }
  }


}
