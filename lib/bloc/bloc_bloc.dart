import 'package:bloc/bloc.dart';
import 'package:mvvm_apps/bloc/bloc_event.dart';
import 'package:mvvm_apps/bloc/bloc_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super( CounterStates()) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
    on<Reset>(_reset);
  }

  void _increment(Increment event, Emitter<CounterStates> emit) {
    emit(state.copyWith(number: state.countNumber + 1));
  }

  void _decrement(Decrement event, Emitter<CounterStates> emit) {
    if (state.countNumber > 0) {
      emit(state.copyWith(number: state.countNumber - 1));
    }
  }

  void _reset(Reset event, Emitter<CounterStates> emit) {
    emit( CounterStates());
  }
}