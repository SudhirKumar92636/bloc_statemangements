import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/counter_bloc/counter_bloc.dart';
import 'package:mvvm_apps/counter_bloc/counter_events.dart';
import 'package:mvvm_apps/counter_bloc/counter_states.dart';

class CounterScreensNumber extends StatefulWidget {
  const CounterScreensNumber({super.key});

  @override
  State<CounterScreensNumber> createState() => _CounterScreensNumberState();
}

class _CounterScreensNumberState extends State<CounterScreensNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screens"),
        backgroundColor: Colors.blue,
      ),
      body:  BlocBuilder<CounterNumberBloc , CountNumberStates>(builder: (context, state) {
        return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Counter Number---${state.counterNumber}"),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                context.read<CounterNumberBloc>().add(CountNumbers());
              }, icon: Icon(Icons.add)),
              IconButton(onPressed: (){
                context.read<CounterNumberBloc>().add(DisCountNumber());
              }, icon:Icon(Icons.remove))
            ],
          )
        ],
      );
    
      },)
    
    
    );
  }
}