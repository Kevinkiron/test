part of 'splash_bloc.dart';

class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class Navigate extends SplashEvent {}

class Increament extends SplashEvent {}

class Decrement extends SplashEvent {}

class NavigateToNextPage extends SplashEvent {
  final int currentIndex;

  NavigateToNextPage({
    required this.currentIndex,
  });

  @override
  List<Object> get props => [currentIndex];
}
