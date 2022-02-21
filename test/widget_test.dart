import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc/counter/view/counter_page.dart';
import 'package:counter_bloc/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

// class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
//     implements CounterBloc {}
@GenerateMocks([CounterBloc])
void main() {
  group('Widget CounterBloc', () {
    late MockCounterBloc mockCounterBloc;

    setUp(() {
      mockCounterBloc = MockCounterBloc();
    });

    testWidgets('Counter Widget should have a number',
        (WidgetTester tester) async {
      // when(() => mockCounterBloc.state)
      //     .thenReturn(() => const CounterSucces(count: 0));
      when(mockCounterBloc.state).thenReturn(const CounterSucces(count: 0));
      //Build our app and trigger a frame
      await tester.pumpWidget(BlocProvider<MockCounterBloc>(
        create: (context) => MockCounterBloc(),
        child: const MaterialApp(
          home: CounterPage(),
        ),
      ));
      // await tester.pumpWidget(MaterialApp(
      //   home: CounterPage(),
      // ));
      //Verify that our counter starts at 0.
      // expect(find.text('0'), findsOneWidget);
    });
  });
}
/**   BlocProvider.value(
        value: mockCounterBloc,
        child: const CounterView(),
      ) */
