import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_training_flutterly/constants/enums.dart';
import 'package:bloc_training_flutterly/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin{


  CounterCubit()
      : super(CounterState(counterValue: 0)) ;

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncrement: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasIncrement: false));

  @override
  CounterState fromJson(Map<String, dynamic> mapJson) {
    return CounterState.fromMap(mapJson);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }


}
