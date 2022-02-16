import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        // child: BlocListener<CounterBloc, int>(
        //   listener: (context, state) {
        //     ScaffoldMessenger.of(context)
        //       ..hideCurrentSnackBar()
        //       ..showSnackBar(SnackBar(content: Text('counter: $state')));
        //   },
        //   child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
        //     return Text(
        //       '$state',
        //       style: const TextStyle(fontSize: 20),
        //     );
        //   }),
        // ),
        child: BlocConsumer<CounterBloc, CounterState>(
            builder: (context, state) {
              log('message ${state.count}');
              return Text('You have pushed the button ${state.count} times');
            },
            listener: (context, state) =>
                ScaffoldMessenger.of(context)..hideCurrentSnackBar()
            // ..showSnackBar(SnackBar(
            //   content: Text('counter $state'),
            // )),
            ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () =>
                context.read<CounterBloc>().add(CounterIncrementPressed()),
          ),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () =>
                context.read<CounterBloc>().add(CounterDecrementPressed()),
          ),
        ],
      ),
    );
  }
}
