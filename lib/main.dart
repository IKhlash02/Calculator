import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Container(
          color: Theme.of(context).primaryColor,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              nilai.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
          ),
        )),
        GridView.count(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: <Widget>[
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorLight,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: 'c',
              onTap: () {
                setState(() {
                  nilai = '0';
                });
              },
            ),
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorLight,
              foregroundColor: Theme.of(context).primaryColorDark,
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
              backgroundColor: Theme.of(context).primaryColorLight,
              foregroundColor: Theme.of(context).primaryColorDark,
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
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).primaryColorLight,
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
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '7',
              onTap: () {
                pressnumber(7);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '8',
              onTap: () {
                pressnumber(8);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '9',
              onTap: () {
                pressnumber(9);
              },
            ),
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).primaryColorLight,
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
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '4',
              onTap: () {
                pressnumber(4);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '5',
              onTap: () {
                pressnumber(5);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '6',
              onTap: () {
                pressnumber(6);
              },
            ),
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).primaryColorLight,
              text: 'X',
              onTap: () {
                setState(
                  () {
                    if (nilai[nilai.length - 1].contains('X')) {
                      nilai = nilai;
                    } else {
                      nilai = '${nilai}X';
                    }
                  },
                );
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '1',
              onTap: () {
                pressnumber(1);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '2',
              onTap: () {
                pressnumber(2);
              },
            ),
            CalculatorButton(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '3',
              onTap: () {
                pressnumber(3);
              },
            ),
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).primaryColorLight,
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
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '0',
              onTap: () {
                pressnumber(0);
              },
            ),
            CalculatorButton(
                backgroundColor: Colors.blue,
                foregroundColor: Theme.of(context).primaryColorDark,
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
              backgroundColor: Theme.of(context).primaryColorLight,
              foregroundColor: Theme.of(context).primaryColorDark,
              text: '=',
              onTap: () {},
            ),
            CalculatorButton(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).primaryColorLight,
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
        )
      ]),
    );
  }

  void pressnumber(int angka) {
    setState(() {
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
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;
  final Function() onTap;

  CalculatorButton({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.onTap,
  });

  // ignore: non_constant_identifier_names
  CalculatorButton.Icon({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: foregroundColor),
                  )
                : Icon(
                    icon,
                    color: foregroundColor,
                  ),
          ),
        ),
      ),
    );
  }
}
