import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int value;

  MyObject({
    required this.value,
  });

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyObject _myObject;
  String? title;

  @override
  void initState() {
    super.initState();
    _myObject = MyObject(value: 0);
  }

  Widget _buildText() {
    return Text(
      'Giá trị: ${_myObject.value}',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              OutlinedButton(
                onPressed: () {
                  _myObject.increment();
                  setState(() {});
                },
                child: const Text('Tăng giá trị'),
              ),
              OutlinedButton(
                onPressed: () {
                  _myObject.decrement();
                  setState(() {});
                },
                child: const Text('Giảm giá trị'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
