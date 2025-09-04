import 'package:equatable/equatable.dart';

class CountNumberStates extends Equatable{
  final int counterNumber ;
  CountNumberStates({this.counterNumber =0});

  CountNumberStates copyWith({int? numbers }){
    return CountNumberStates(
      counterNumber:numbers ?? this.counterNumber );
  }

  List<Object?> get props => [counterNumber];
}