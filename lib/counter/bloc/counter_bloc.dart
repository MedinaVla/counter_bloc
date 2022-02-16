import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(const CounterInitial(
          count: 0,
        )) {
    on<CounterIncrementPressed>(
        (event, emit) => emit(CounterSucces(count: state.count + 1)));
    on<CounterDecrementPressed>(
        (event, emit) => emit(CounterSucces(count: state.count - 1)));
  }
}
