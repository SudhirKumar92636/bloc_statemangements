import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apps/counter_bloc/counter_events.dart';
import 'package:mvvm_apps/counter_bloc/counter_states.dart';

class CounterNumberBloc extends Bloc<CountNumberEvents , CountNumberStates>{
  CounterNumberBloc() : super(CountNumberStates()){
    on<CountNumbers>(_countAllNumber);
    on<DisCountNumber>(_deCrementsNumber);
  }
  void _countAllNumber(CountNumbers events , Emitter<CountNumberStates> emit){
    emit(state.copyWith(numbers: state.counterNumber + 1));
  }


  void _deCrementsNumber(DisCountNumber events , Emitter<CountNumberStates>emit){
   emit(state.copyWith(numbers: state.counterNumber-1));
  }
}


