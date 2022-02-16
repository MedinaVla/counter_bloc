part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}
