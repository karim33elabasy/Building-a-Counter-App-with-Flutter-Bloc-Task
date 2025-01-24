import 'package:create_different_blocs_task/controllers/counter_bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  int _number = 0;
  CounterCubit(): super(InitialCounterState());

  int get number => _number;

  void addNumber(){
    _number++;
    emit(NumberChange(number: _number));
  }

  void decreaseNumber(){
    _number--;
    emit(NumberChange(number: _number));
  }

  void resetNumber(){
    _number = 0;
    emit(NumberChange(number: _number));
  }

}