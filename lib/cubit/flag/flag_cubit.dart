import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/flag_model.dart';

part 'flag_state.dart';

class FlagCubit extends Cubit<FlagState> {
  FlagCubit() : super(FlagInitial());

  void loadedFlag(){
    emit(const FlagLoaded());
  }

  void onPressDownFlag(int indexSelectedValue, int indexSelected){

    final state = this.state as FlagLoaded;
    final flagColorList = [...state.flagColorList];
    final listIndexSelected = [...state.listIndexSeleted];
    listIndexSelected[indexSelected] = -1;
    flagColorList[indexSelectedValue] = Flag(flagColor: flagColorList[indexSelectedValue].flagColor, isPress: true);

    emit(FlagLoaded(listIndexSeleted: listIndexSelected, flagColorList: flagColorList));

  }

  void onPressUpFlag(int indexColor){
    final state = this.state as FlagLoaded;
    final flagColorList = [...state.flagColorList];
    final listIndexSelected = [...state.listIndexSeleted];

    int indexSelected = listIndexSelected.indexWhere((element) => element == -1);
    listIndexSelected[indexSelected] = indexColor;
    flagColorList[indexColor] = Flag(flagColor: flagColorList[indexColor].flagColor, isPress: false);
    emit(FlagLoaded(flagColorList: flagColorList, listIndexSeleted: listIndexSelected));

  }
}


