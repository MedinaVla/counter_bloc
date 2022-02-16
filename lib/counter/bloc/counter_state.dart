part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);
  @override
  List<Object?> get props => [count];
}

class CounterInitial extends CounterState {
  const CounterInitial({
    count,
  }) : super(count);
}

class CounterSucces extends CounterState {
  const CounterSucces({
    count,
  }) : super(count);
}

class CounterFailure extends CounterState {
  const CounterFailure({
    required this.errorCcount,
  }) : super(0);
  final String errorCcount;

  @override
  List<Object?> get props => [errorCcount];
}
