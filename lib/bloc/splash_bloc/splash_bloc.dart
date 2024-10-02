import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<Navigate>(_navigateTo);
    on<NavigateToNextPage>(_navigateToNextPage);
    on<Increament>(_valueInc);
    on<Decrement>(_valueDec);
  }

  Future<void> _navigateTo(Navigate event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 3), () {
      emit(state.copyWith(status: StatusState.onboard));
    });
  }

  void _navigateToNextPage(
      NavigateToNextPage event, Emitter<SplashState> emit) {
    emit(state.copyWith(onBoardOndex: event.currentIndex));
  }

  void _valueInc(Increament event, Emitter<SplashState> emit) {
    emit(state.copyWith(value: state.value + 1));
  }

  void _valueDec(Decrement event, Emitter<SplashState> emit) {
    if (state.value > 0) {
      emit(state.copyWith(value: state.value - 1));
    }
  }
}
