import 'package:bloc_counter/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        const SizedBox(height: 24),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => context.read<CounterCubit>().increment(),
        ),
      ],
    );
  }
}
