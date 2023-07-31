import 'package:calculator/componenents/my_button.dart';
import 'package:calculator/constant.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '+/-',
                          onpress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '%',
                          onpress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '/',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '8',
                          onpress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '9',
                          onpress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: 'x',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '5',
                          onpress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '6',
                          onpress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '-',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '2',
                          onpress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '3',
                          onpress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '+',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: 'DEL',
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyButton(
                          title: '=',
                          color: Color(0xffffa00a),
                          onpress: () {
                            equalPres();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finaluserInput = userInput;
    finaluserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
