import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int value;

  const Counter(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
