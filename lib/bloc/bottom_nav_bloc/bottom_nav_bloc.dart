import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<BottomNavigationIndex>(_bottomNavigationIndex);
  }

  void _bottomNavigationIndex(
      BottomNavigationIndex event, Emitter<BottomNavState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
