part of 'flag_bloc.dart';

abstract class FlagEvent extends Equatable {
  const FlagEvent();
}

class LoadFlagEvent extends FlagEvent {
  @override
  List<Object?> get props => [];

}

class OnPressUpFlagEvent extends FlagEvent {
  final int indexSelectedValue;
  final int indexSelected;

  const OnPressUpFlagEvent({required this.indexSelectedValue, required this.indexSelected});

  @override
  List<Object?> get props => [indexSelected, indexSelectedValue];

}

class OnPressDownFlagEvent extends FlagEvent {
  final int indexColor;

  const OnPressDownFlagEvent({required this.indexColor});
  @override
  List<Object?> get props => [indexColor];

}