import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../widgets/widgets.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const CardGlass(),
          Positioned(
            bottom: 50,
            left: 100,
            right: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context
                      .read<CounterBloc>()
                      .add(CounterIncrementPressed()),
                  child: const GlassMorphism(
                      radius: 50,
                      blur: 20,
                      opacity: 0.2,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.add),
                      )),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<CounterBloc>()
                      .add(CounterDecrementPressed()),
                  child: const GlassMorphism(
                      radius: 50,
                      blur: 20,
                      opacity: 0.2,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.remove),
                      )),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
