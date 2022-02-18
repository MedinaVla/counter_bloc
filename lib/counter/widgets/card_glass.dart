import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc/counter/cubit/glass_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'glass_morphism.dart';

class CardGlass extends StatelessWidget {
  const CardGlass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GlassCubit, bool>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context.read<GlassCubit>().changeGlassOpacity();
            },
            child: GlassMorphism(
              blur: state ? 20 : 0,
              opacity: 0.2,
              radius: 20,
              child: SizedBox(
                height: 210,
                width: 320,
                child: Center(
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(
                        ' ${state.count}',
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
