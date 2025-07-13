import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(state.counter.toString()),
                );
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncreamentCounter());
                  },
                  child: Text("Increament"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: Text("Decrement"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
