part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState {}

final class BottomNavigationBarInitial extends BottomNavigationBarState {}

final class BottomNavigationBarHome extends BottomNavigationBarState {}

final class BottomNavigationBarCategory extends BottomNavigationBarState {}

final class BottomNavigationBarChat extends BottomNavigationBarState {}

final class BottomNavigationBarCart extends BottomNavigationBarState {}

final class BottomNavigationBarSearch extends BottomNavigationBarState {}
