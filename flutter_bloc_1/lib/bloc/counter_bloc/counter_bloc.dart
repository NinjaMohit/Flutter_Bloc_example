import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncreamentCounter>(
      (IncreamentCounter event, Emitter<CounterState> emit) {
        emit(state.copyWith(counter: state.counter + 1));
      },
    );
    on<DecrementCounter>(
      (DecrementCounter event, Emitter<CounterState> emit) {
        emit(state.copyWith(counter: state.counter - 1));
      },
    );
  }
}
