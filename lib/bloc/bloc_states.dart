// import 'package:equatable/equatable.dart';

// class CounterStates extends Equatable {
//   final int countNumber;
//   const CounterStates({this.countNumber = 0});
//   CounterStates copyWith({int? number}) {
//     return CounterStates(
//       countNumber: number ?? this.countNumber,
//     );
//   }

//   @override
//   List<Object> get props => [countNumber];
// }



import 'package:equatable/equatable.dart';

class CounterStates extends Equatable{
  final int countNumber;
  CounterStates({this.countNumber = 0});
  CounterStates copyWith({int? number}){
    return CounterStates(
       countNumber: number ?? this.countNumber
    );
  }
  List<Object?> get props => [countNumber];
}