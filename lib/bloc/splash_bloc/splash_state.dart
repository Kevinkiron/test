part of 'splash_bloc.dart';

enum StatusState { initial, onboard }

class SplashState extends Equatable {
  final StatusState status;
  final int onBoardOndex;
  final int value;
  const SplashState({
    this.onBoardOndex = 0,
    this.value = 0,
    this.status = StatusState.initial,
  });
  SplashState copyWith({
    StatusState? status,
    int? onBoardOndex,
    bool? isTextExpanded,
    int? value,
  }) {
    return SplashState(
      status: status ?? this.status,
      value: value ?? this.value,
      onBoardOndex: onBoardOndex ?? this.onBoardOndex,
    );
  }

  @override
  List<Object> get props => [status, onBoardOndex, value];
}
