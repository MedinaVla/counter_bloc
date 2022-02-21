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
  });
}
