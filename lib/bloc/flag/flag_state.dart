part of 'flag_bloc.dart';

abstract class FlagState extends Equatable {
  const FlagState();
}

class FlagInitial extends FlagState {
  @override
  List<Object> get props => [];
}

class FlagLoaded extends FlagState {
  final List<Flag> flagColorList;
  final List<int> listIndexSelected;
  //final int indexColor;

  const FlagLoaded({this.listIndexSelected = const [-1, -1, -1],  this.flagColorList = const [
    Flag(flagColor: Colors.red, isPress: true),
    Flag(flagColor: Colors.green, isPress: true),
    Flag(flagColor: Colors.orange, isPress: true),
    Flag(flagColor: Colors.yellow, isPress: true),
    Flag(flagColor: Colors.blue, isPress: true),
    Flag(flagColor: Colors.purple, isPress: true),
  ] });

  @override
  List<Object> get props => [listIndexSelected, flagColorList];
}