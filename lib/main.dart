import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nilai = '0';
  var hasil = "";
  bool isBold = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcf6e6),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(nilai.toString(),
                      style: (isBold)
                          ? const TextStyle(
                              fontSize: 50,
                              color: Color(0xff394d3f),
                              fontWeight: FontWeight.bold)
                          : const TextStyle(
                              fontSize: 25,
                              color: Color(0xff394d3f),
                              fontWeight: FontWeight.w400)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    hasil.toString(),
                    style: const TextStyle(
                        fontSize: 50,
                        color: Color(0xff394d3f),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 40),
          decoration: const BoxDecoration(
              color: Color(0xffb8f3d8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                text: 'c',
                onTap: () {
                  isBold = true;
                  setState(() {
                    nilai = '0';
                    hasil = "";
                  });
                },
              ),
              CalculatorButton(
                text: '+/-',
                onTap: () {
                  setState(() {
                    if (nilai != '0') {
                      if (nilai.contains('-')) {
                        nilai = nilai.substring(0, nilai.length - 1);
                      } else {
                        nilai = '-$nilai';
                      }
                    }
                  });
                },
              ),
              CalculatorButton(
                text: '%',
                onTap: () {
                  setState(
                    () {
                      if (nilai[nilai.length - 1].contains('%')) {
                        nilai = nilai;
                      } else {
                        nilai = '$nilai%';
                      }
                    },
                  );
                },
              ),
              CalculatorButton.Icon(
                text: 'backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    if (nilai == '0' ||
                        nilai == '' ||
                        nilai.length == 1 ||
                        (nilai[0].contains('-') && nilai.length == 2)) {
                      nilai = '0';
                    } else {
                      nilai = nilai.substring(0, nilai.length - 1);
                    }
                  });
                },
              ),
              CalculatorButton(
                text: '7',
                onTap: () {
                  pressnumber(7);
                },
              ),
              CalculatorButton(
                text: '8',
                onTap: () {
                  pressnumber(8);
                },
              ),
              CalculatorButton(
                text: '9',
                onTap: () {
                  pressnumber(9);
                },
              ),
              CalculatorButton(
                text: '/',
                onTap: () {
                  setState(
                    () {
                      if (nilai[nilai.length - 1].contains('/')) {
                        nilai = nilai;
                      } else {
                        nilai = '$nilai/';
                      }
                    },
                  );
                },
              ),
              CalculatorButton(
                text: '4',
                onTap: () {
                  pressnumber(4);
                },
              ),
              CalculatorButton(
                text: '5',
                onTap: () {
                  pressnumber(5);
                },
              ),
              CalculatorButton(
                text: '6',
                onTap: () {
                  pressnumber(6);
                },
              ),
              CalculatorButton(
                text: 'x',
                onTap: () {
                  setState(
                    () {
                      if (nilai[nilai.length - 1].contains('*')) {
                        nilai = nilai;
                      } else {
                        nilai = '$nilai*';
                      }
                    },
                  );
                },
              ),
              CalculatorButton(
                text: '1',
                onTap: () {
                  pressnumber(1);
                },
              ),
              CalculatorButton(
                text: '2',
                onTap: () {
                  pressnumber(2);
                },
              ),
              CalculatorButton(
                text: '3',
                onTap: () {
                  pressnumber(3);
                },
              ),
              CalculatorButton(
                text: '-',
                onTap: () {
                  setState(
                    () {
                      if (nilai[nilai.length - 1].contains('-')) {
                        nilai = nilai;
                      } else {
                        nilai = '$nilai-';
                      }
                    },
                  );
                },
              ),
              CalculatorButton(
                text: '0',
                onTap: () {
                  pressnumber(0);
                },
              ),
              CalculatorButton(
                  text: '.',
                  onTap: () {
                    setState(
                      () {
                        if (nilai.contains('.')) {
                          nilai = nilai;
                        } else {
                          nilai = '$nilai.';
                        }
                      },
                    );
                  }),
              CalculatorButton(
                text: '=',
                onTap: () {
                  setState(() {
                    String equation = nilai;
                    String result;

                    if (equation.endsWith("+") ||
                        equation.endsWith("-") ||
                        equation.endsWith("*") ||
                        equation.endsWith("/")) {
                      equation = equation.substring(0, equation.length - 1);
                    }

                    try {
                      Parser p = Parser();
                      Expression exp = p.parse(equation);
                      ContextModel cm = ContextModel();
                      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
                    } catch (e) {
                      result = "Error";
                    }
                    isBold = false;
                    hasil = result;
                  });
                },
              ),
              CalculatorButton(
                text: '+',
                onTap: () {
                  setState(
                    () {
                      if (nilai[nilai.length - 1].contains('+')) {
                        nilai = nilai;
                      } else {
                        nilai = '$nilai+';
                      }
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }

  void pressnumber(int angka) {
    setState(() {
      isBold = true;
      if (nilai == '0') {
        nilai = '$angka';
      } else {
        nilai = '$nilai$angka';
      }
    });
  }
}

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final String text;
  IconData? icon;
  final Function() onTap;

  CalculatorButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  // ignore: non_constant_identifier_names
  CalculatorButton.Icon({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfffcf6e6),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xff394d3f),
                    spreadRadius: 2,
                    offset: Offset(4, 4))
              ]),
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: const TextStyle(
                        fontSize: 25,
                        color: Color(0xff394d3f),
                        fontWeight: FontWeight.bold),
                  )
                : Icon(
                    icon,
                    color: const Color(0xff394d3f),
                  ),
          ),
        ),
      ),
    );
  }
}
