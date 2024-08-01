import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// ignore: unused_import
import 'calcButton.dart';

void main() {
  runApp(VpCalc());
}

class VpCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = '0';
  int flag = 0;
  int flag2 = 0;
  bool checkLastChar() {
    if (text[text.length - 1] == '+' ||
        text[text.length - 1] == '-' ||
        text[text.length - 1] == '%' ||
        text[text.length - 1] == '/' ||
        text[text.length - 1] == '*') return true;
    return false;
  }

  void press(String setText) {
    setState(() {
      if (text == '0')
        text = setText;
      else if (text == 'Enter number first' || text == 'Error')
        text = text.replaceRange(0, null, setText);
      else if (flag2 == 1) {
        text = setText;
        flag2 = 0;
      } else
        text = text + setText;
    });
  }

  void calc(String setText) {
    if (text == '0')
      text = setText;
    else if (checkLastChar()) {
      text = text.replaceRange(text.length - 1, null, setText);
      flag = 0;
    } else if (text == 'Enter number first' || text == 'Error')
      text = 'Enter number first';
    else if (flag2 == 1) {
      text = text + setText;
      flag2 = 0;
      flag = 0;
    } else {
      text = text + setText;
      flag = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF000000),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Color(0xFF000000),
            padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'images/Screenshot 2023-08-07 193735.png'),
                          // fit: BoxFit.fill
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Vision Plus",
                    style: TextStyle(fontSize: 35, color: Color(0xFF009CFF)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            children: [
              CalcButton(
                text: 'AC',
                color: Color(0xFF009CFF),
                textColor: Colors.white,
                onTapped: () {
                  setState(() {
                    text = '0';
                    flag = 0;
                    flag2 = 0;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.all(7),
                child: MaterialButton(
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.delete,
                        size: 40,
                        color: Color(0xFF009CFF),
                      )),
                  onPressed: () {
                    setState(() {
                      if (text == 'Enter number first' || text == 'Error')
                        text = text.replaceRange(0, null, '0');
                      else if (text.length - 1 != 0) {
                        if (text[text.length - 1] == '.') flag = 0;
                        if ((checkLastChar()) && flag == 0) flag = 1;
                        text = text.replaceRange(text.length - 1, null, '');
                      } else
                        text = '0';
                    });
                  },
                ),
              ),
              CalcButton(
                  text: '%',
                  color: Color(0xFF1E1E1E),
                  textColor: Color(0xFF009CFF),
                  onTapped: () {
                    setState(() {
                      calc('%');
                    });
                  }),
              CalcButton(
                text: '*',
                color: Color(0xFF1E1E1E),
                textColor: Color(0xFF009CFF),
                onTapped: () {
                  setState(() {
                    calc('+');
                  });
                },
              ),
              CalcButton(
                  text: '7',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('7');
                    });
                  }),
              CalcButton(
                  text: '8',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('8');
                    });
                  }),
              CalcButton(
                  text: '9',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('9');
                    });
                  }),
              CalcButton(
                text: '/',
                color: Color(0xFF1E1E1E),
                textColor: Color(0xFF009CFF),
                onTapped: () {
                  setState(() {
                    calc('/');
                  });
                },
              ),
              CalcButton(
                  text: '4',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('4');
                    });
                  }),
              CalcButton(
                  text: '5',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('5');
                    });
                  }),
              CalcButton(
                  text: '6',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('6');
                    });
                  }),
              CalcButton(
                text: '+',
                color: Color(0xFF1E1E1E),
                textColor: Color(0xFF009CFF),
                onTapped: () {
                  setState(() {
                    calc('+');
                  });
                },
              ),
              CalcButton(
                  text: '1',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('1');
                    });
                  }),
              CalcButton(
                  text: '2',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('2');
                    });
                  }),
              CalcButton(
                  text: '3',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('3');
                    });
                  }),
              CalcButton(
                text: '-',
                color: Color(0xFF1E1E1E),
                textColor: Color(0xFF009CFF),
                onTapped: () {
                  setState(() {
                    calc('-');
                  });
                },
              ),
              Container(),
              CalcButton(
                  text: '0',
                  color: Color(0xFF1E1E1E),
                  textColor: Colors.white,
                  onTapped: () {
                    setState(() {
                      press('0');
                    });
                  }),
              CalcButton(
                text: '.',
                color: Color(0xFF1E1E1E),
                textColor: Colors.white,
                onTapped: () {
                  setState(() {
                    if (text == '0' && flag == 0) {
                      text = '.';
                      flag = 1;
                    } else if ((text == 'Enter number first' ||
                            text == 'Error') &&
                        flag == 0) {
                      text = text.replaceRange(0, null, '.');
                      flag = 1;
                    } else if (flag == 0) {
                      text = text + '.';
                      flag = 1;
                    } else if (flag2 == 1) {
                      text = '.';
                      flag2 = 0;
                    }
                  });
                },
              ),
              CalcButton(
                text: '=',
                color: Color(0xFF009CFF),
                textColor: Colors.white,
                onTapped: () {
                  setState(() {
                    if (text[text.length - 1] == '0' &&
                        text[text.length - 2] == '/')
                      text = 'Error';
                    else if (!(checkLastChar())) {
                      Parser p = Parser();
                      Expression exp = p.parse(text);
                      ContextModel cm = ContextModel();
                      double eval = exp.evaluate(EvaluationType.REAL, cm);
                      text = eval.toString();
                      if (text[text.length - 1] == '0' &&
                          text[text.length - 2] == '.')
                        text = text.replaceRange(text.length - 2, null, '');
                      flag2 = 1;
                    }
                  });
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
