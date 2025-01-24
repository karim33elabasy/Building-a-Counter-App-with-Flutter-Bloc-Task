import 'package:create_different_blocs_task/controllers/counter_bloc/counter_events.dart';
import 'package:create_different_blocs_task/controllers/counter_bloc/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents,CounterStates>{
  int number = 0;
  CounterBloc(): super(InitialCounterState()){
    on<CounterEvents>((event,emit){
      if(event is AddingNumber){
        number++;
        emit(NumberChange(number: number));
      }
      else if(event is ResettingNumber){
        number = 0;
        emit(NumberChange(number: number));
      }
    });
  }

}