import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/bloc/bloc_bloc.dart';
import 'package:mvvm_apps/bloc/bloc_event.dart';
import 'package:mvvm_apps/bloc/bloc_states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                // Counter display with animation
                BlocBuilder<CounterBloc, CounterStates>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Text(
                        '${state.countNumber}',
                        key: ValueKey<int>(state.countNumber),
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton(
                      context,
                      icon: Icons.remove,
                      onPressed: () => context.read<CounterBloc>().add(Decrement()),
                      color: Colors.redAccent,
                    ),
                    const SizedBox(width: 20),
                    _buildButton(
                      context,
                      icon: Icons.add,
                      onPressed: () => context.read<CounterBloc>().add(Increment()),
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 20),
                    _buildButton(
                      context,
                      icon: Icons.refresh,
                     onPressed: () => context.read<CounterBloc>().add(Reset()),
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required IconData icon, required VoidCallback onPressed, required Color color}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}