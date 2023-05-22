import 'dart:async';

import 'package:bloc/bloc.dart';

import 'deret_event.dart';
import 'deret_state.dart';

class DeretBloc extends Bloc<DeretEvent, DeretState> {
  DeretBloc() : super(DeretInitial()) {
    on<ButtonOneClicked>(buttonOneClicked);
    on<ButtonTwoClicked>(buttonTwoClicked);
    on<ButtonThreeClicked>(buttonThreeClicked);
    on<ButtonFourClicked>(buttonFourClicked);
  }

  FutureOr<void> buttonOneClicked(ButtonOneClicked event, Emitter<DeretState> emit) {
    emit(DeretLoading());

    List<int> loop = [];

    for(int i = 1; i <= event.number; i++) {
      loop.add(i);
    }

    emit(DeretSuccess(looping: loop));
  }

  FutureOr<void> buttonTwoClicked(ButtonTwoClicked event, Emitter<DeretState> emit) {
    emit(DeretLoading());

    List<int> loop = [];

    for(int i = 1; i <= event.number; i++) {
      loop.add(i);
    }

    for (int i = event.number - 1; i >= 1; i--) {
      loop.add(i);
    }

    emit(DeretSuccess(looping: loop));
  }

  FutureOr<void> buttonThreeClicked(ButtonThreeClicked event, Emitter<DeretState> emit) {
    emit(DeretLoading());

    List<int> loop = [];

    int start = 10;
    int next = 11;

    for(int i = 0; i < event.number; i++) {
      int num = start + (next * i);
      loop.add(num);
    }

    emit(DeretSuccess(looping: loop));
  }

  FutureOr<void> buttonFourClicked(ButtonFourClicked event, Emitter<DeretState> emit) {
    emit(DeretLoading());

    List<String> loop = [];

    for(int i = 1; i <= event.number; i++) {
      if(i % 5 == 0 && i % 7 == 0) {
        loop.add("LIMA TUJUH");
        continue;
      }

      if(i % 5 == 0) {
        loop.add("LIMA");
        continue;
      }

      if(i % 7 == 0) {
        loop.add("TUJUH");
        continue;
      }

      loop.add(i.toString());
    }

    emit(DeretSuccess(looping: loop));
  }
}
