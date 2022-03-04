import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_training_flutterly/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test(
        'the initial state for the counterCubit is CounterState(counterValue:0)', () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest('test the increment function the CounterState should be (1,true)',
        build: () => counterCubit,
        act: (cubit) => counterCubit.increment() ,
      expect: () => [CounterState(counterValue: 1, wasIncrement: true)],
    );

    blocTest('test the decrement function the CounterState should be (0,false)',
      build: () => counterCubit,
      act: (cubit) => counterCubit.decrement() ,
      expect: () => [CounterState(counterValue: -1, wasIncrement: false)],
    );


  });
}
