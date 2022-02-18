import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/glass_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => GlassCubit(),
        ),
      ],
      child: const CounterView(),
    );
  }
}
