import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_1_count/bloc/counter_event.dart';
import 'package:flutter_bloc_1_count/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(
      (event, emit) {
        emit(state.copyWith(count: state.count + 1));
      },
    );
    on<DecrementCounter>(
      (event, emit) {
        emit(state.copyWith(count: state.count - 1));
      },
    );
    on<Reset>(
      (event, emit) {
        emit(state.copyWith(count: 0));
      },
    );
  }
}
