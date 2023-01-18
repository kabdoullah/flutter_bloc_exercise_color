part of 'flag_cubit.dart';

abstract class FlagState extends Equatable {
  const FlagState();
}

class FlagInitial extends FlagState {
  @override
  List<Object> get props => [];
}

class FlagLoaded extends FlagState {
  final List<Flag> flagColorList;
  final List<int> listIndexSeleted;

  const FlagLoaded({this.listIndexSeleted = const [-1, -1, -1],  this.flagColorList = const [
    Flag(flagColor: Colors.red, isPress: true),
    Flag(flagColor: Colors.green, isPress: true),
    Flag(flagColor: Colors.orange, isPress: true),
    Flag(flagColor: Colors.yellow, isPress: true),
    Flag(flagColor: Colors.blue, isPress: true),
    Flag(flagColor: Colors.purple, isPress: true),
  ] });

  @override
  List<Object> get props => [listIndexSeleted, flagColorList];
}