import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc/counter/cubit/glass_cubit.dart';
import 'package:counter_bloc/counter/view/counter_page.dart';
import 'package:counter_bloc/counter/view/counter_view.dart';
import 'package:counter_bloc/counter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

// class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
//     implements CounterBloc {}
@GenerateMocks([CounterBloc, GlassCubit])
void main() {
  group('Widget CounterBloc', () {
    late MockCounterBloc mockCounterBloc;
    late MockGlassCubit mockGlassCubit;

    setUp(() {
      mockCounterBloc = MockCounterBloc();
      mockGlassCubit = MockGlassCubit();
    });

    testWidgets('renders CounterPage', (WidgetTester tester) async {
      when(mockCounterBloc.state).thenReturn(const CounterSucces(count: 0));

      await tester.pumpWidget(BlocProvider<MockCounterBloc>.value(
        value: mockCounterBloc,
        child: const MaterialApp(
          home: CounterPage(),
        ),
      ));

      //Verify that CounterView renders.
      expect(find.byType(CounterView), findsOneWidget);
    });

    testWidgets('renders CounterInitial', (tester) async {
      // when(mockGlassCubit.state).thenReturn(false);
      when(mockCounterBloc.state).thenReturn(const CounterSucces(count: 0));

      when(mockGlassCubit.state).thenReturn(false);
      await tester.pumpWidget(MultiBlocProvider(
          providers: [
            BlocProvider<CounterBloc>(
              create: (_) => MockCounterBloc(),
            ),
            BlocProvider<GlassCubit>(
              create: (context) => MockGlassCubit(),
            ),
          ],
          child: MaterialApp(
            home: CounterPage(),
          )));
      // expect(find.byType(CardGlass), findsOneWidget);
    });
  });
}
/**   BlocProvider.value(
        value: mockCounterBloc,
        child: const CounterView(),
      ) */
