import 'dart:js' as js;

import 'package:bloc_counter/bloc/random_string_cubit.dart';
import 'package:bloc_counter/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = RandomStringCubit();

        js.context['dartFunction'] = (js.JsObject pTag) {
          var input = pTag['input'];
          cubit.changeValue(input);
        };

        return cubit;
      },
      child: MaterialApp(
        title: 'BLoC Counter',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
