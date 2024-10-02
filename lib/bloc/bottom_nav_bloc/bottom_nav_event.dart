part of 'bottom_nav_bloc.dart';

class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationIndex extends BottomNavEvent {
  final int index;
  const BottomNavigationIndex({required this.index});

  @override
  List<Object> get props => [index];
}
