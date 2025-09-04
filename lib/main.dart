import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/api_bloc/post_api_bloc.dart';
import 'package:mvvm_apps/counter_bloc/counter_bloc.dart';
import 'package:mvvm_apps/counter_bloc/view/counter-screens.dart';
import 'package:mvvm_apps/view/show_post_api_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostApiBloc(),
      child: BlocProvider(
        create: (context) => CounterNumberBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: ShowPostApiData(),
          home: CounterScreensNumber(),
        ),
      ),
    );
  }
}
