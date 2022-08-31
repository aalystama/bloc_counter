import 'dart:js' as js;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<RandomStringCubit, String?>(
            builder: (context, state) {
              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(
                      text: 'Random string value is:\n',
                      style: TextStyle(fontSize: 24),
                    ),
                    TextSpan(text: state ?? 'null')
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          TextButton(
            child: const Text('Call Android'),
            onPressed: () {
              js.context.callMethod('androidApp.makeToast', ['Hello World!']);
            },
          ),
          const SizedBox(height: 24),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Counter(state);
            },
          ),
        ],
      ),
    );
  }
}
