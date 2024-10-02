part of 'bottom_nav_bloc.dart';

class BottomNavState extends Equatable {
  final int index;
  const BottomNavState({
    this.index = 2,
  });
  BottomNavState copyWith({
    int? index,
  }) {
    return BottomNavState(index: index ?? this.index);
  }

  @override
  List<Object> get props => [index];
}
