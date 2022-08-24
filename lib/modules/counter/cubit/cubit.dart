import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  void minus() {
    counter--;
    emit(MinusState());
  }

  void plus() {
    counter++;
    emit(PlusState());
  }

  int counter = 1;
}
