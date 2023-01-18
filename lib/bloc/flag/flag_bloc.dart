import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import '../../models/flag_model.dart';

part 'flag_event.dart';
part 'flag_state.dart';

class FlagBloc extends Bloc<FlagEvent, FlagState> {
  FlagBloc() : super(FlagInitial()) {
    on<LoadFlagEvent>((event, emit) {
      emit(const FlagLoaded());
    });

    on<OnPressUpFlagEvent>((event, emit) {
      final state = this.state as FlagLoaded;
      final flagColorList = [...state.flagColorList];
      final listIndexSelected = [...state.listIndexSelected];
      final indexSelected = event.indexSelected;
      final indexSelectedValue = event.indexSelectedValue;


      listIndexSelected[indexSelected] = -1;
      flagColorList[indexSelectedValue] = Flag(flagColor: flagColorList[indexSelectedValue].flagColor, isPress: true);
      emit(FlagLoaded(listIndexSelected: listIndexSelected, flagColorList: flagColorList));
    });



    on<OnPressDownFlagEvent>((event, emit) {
      final state = this.state as FlagLoaded;
      final flagColorList = [...state.flagColorList];
      final listIndexSelected = [...state.listIndexSelected];
      final indexColor = event.indexColor;
      //final colorSelected = event.colorSelected;

      int indexSelected = listIndexSelected.indexWhere((element) => element == -1);
      listIndexSelected[indexSelected] = indexColor;
      //flagColorList[indexColor] = Flag(flagColor: flagColorList[indexColor].flagColor, isPress: false);
      flagColorList[indexColor] = Flag(flagColor: flagColorList[indexColor].flagColor, isPress: false);
      emit(FlagLoaded(flagColorList: flagColorList, listIndexSelected: listIndexSelected));
    });
  }
}
