// import 'package:equatable/equatable.dart';

// abstract class CounterEvents extends Equatable {
//   const CounterEvents();

//   @override
//   List<Object> get props => [];
// }

// class Increment extends CounterEvents {}

// class Decrement extends CounterEvents {}



import 'package:equatable/equatable.dart';

class CounterEvents extends Equatable{
  const CounterEvents();

  List<Object?> get props => [];
}

class Increment extends CounterEvents{}
class Decrement extends CounterEvents{}
class Reset extends CounterEvents {}