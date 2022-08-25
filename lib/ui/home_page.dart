import 'package:bloc_counter/bloc/counter_cubit.dart';
import 'package:bloc_counter/bloc/random_string_cubit.dart';
import 'package:bloc_counter/ui/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<RandomStringCubit, String?>(
              builder: (context, state) {
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'Random string value is:',
                        style: TextStyle(fontSize: 24),
                      ),
                      TextSpan(text: state ?? 'null')
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Counter(state);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
