
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Flag extends Equatable{
  final Color flagColor;
  final bool isPress;

  const Flag({required this.flagColor, required this.isPress});

  @override
  List<Object?> get props => [flagColor, isPress];


}