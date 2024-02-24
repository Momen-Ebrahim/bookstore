import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());

  homeNavigation() {
    emit(BottomNavigationBarHome());
  }

  categoryNavigation() {
    emit(BottomNavigationBarCategory());
  }

  chatNavigation() {
    emit(BottomNavigationBarChat());
  }

  cartNavigation() {
    emit(BottomNavigationBarCart());
  }

  settingsNavigation() {
    emit(BottomNavigationBarSettings());
  }
}
