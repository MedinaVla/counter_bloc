import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;
    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, const CounterInitial(count: 0));
    });

    blocTest<CounterBloc, CounterState>(
        'emits 1 when CounterIncrementPressed is added',
        build: () => counterBloc,
        act: (bloc) => bloc.add(CounterIncrementPressed()),
        expect: () => [
              const CounterSucces(count: 1),
            ]);

    blocTest<CounterBloc, CounterState>(
        'emit -1 when CounterDecrementPressed is added',
        build: () => counterBloc,
        act: (bloc) => bloc.add(CounterDecrementPressed()),
        expect: () => [
              const CounterSucces(count: -1),
            ]);

    blocTest<CounterBloc, CounterState>(
      'emit 10 when CounterIncrementPressed is added and',
      build: () => counterBloc,
      seed: () => const CounterSucces(count: 9),
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [const CounterSucces(count: 10)],
    );
  });
}
