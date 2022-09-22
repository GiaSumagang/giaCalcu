import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var operator = '';
  var text = '0';

  insertNumber(value) {
    setState(() {
      if (text == '0' || text == 'Infinity') {
        text = value.toString();
      } else {
        text += value.toString();
      }
    });
  }

  setOperator(newOperator) {
    setState(() {
      if (operator != '') {
        calculate();
        text += newOperator.toString();
        operator = newOperator;
      } else {
        text += newOperator.toString();
        operator = newOperator;
      }
    });
  }

  calculate() {
    var data = text.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case '*':
          text = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          text = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          text = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          text = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenSize = 200;

    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text('CALCULATOR',
              style: TextStyle(fontFamily: 'RobotoMono'),),
          )
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            Container(
                color: Colors.black38,
                height: screenSize,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70
                      ),
                    ),
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Divider(color: Colors.purple, height: 5),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setState(() {
                                text = '0';
                                operator = '';
                              });
                            },
                            text: "CE",
                          )
                      ),
                    ],
                  ),
                   Row(
                   children: [
                     Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(7);
                            },
                            text: "7",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(8);
                            },
                            text: "8",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(9);
                            },
                            text: "9",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('/');
                            },
                            text: "/",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(4);
                            },
                            text: "4",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(5);
                            },
                            text: "5",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(6);
                            },
                            text: "6",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('*');
                            },
                            text: "*",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(1);
                            },
                            text: "1",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(2);
                            },
                            text: "2",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(3);
                            },
                            text: "3",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('+');
                            },
                            text: "+",
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber(0);
                            },
                            text: "0",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.black12,
                            onItemTap: () {
                              insertNumber('.');
                            },
                            text: ".",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              setOperator('-');
                            },
                            text: "-",
                          )
                      ),
                    ],
                  ),
                      Row(
                        children: [
                      Expanded(
                          child: CalcButton(
                            textColor: Colors.white,
                            onItemTap: () {
                              calculate();
                            },
                            text: "=",
                          )
                      )
                        ],
                      ),
                    ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {

  final String text;
  final TapCallBack onItemTap;
  final Color? color;
  final Color? textColor;

  const CalcButton({
    required this.text,
    required this.onItemTap,
    this.color,
    this.textColor,
    Key? key})
      : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: const EdgeInsets.all(5),
      child: MaterialButton(
        color: color ?? Colors.green,
        onPressed: onItemTap,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 2),
          borderRadius: BorderRadius.circular(35),
        ),
        child:  Text(text,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 30
          ),
        ),
      ),
    );
  }

}

typedef TapCallBack = void Function();