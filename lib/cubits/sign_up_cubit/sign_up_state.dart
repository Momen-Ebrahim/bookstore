part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpUser extends SignUpState {
  final Color adminColor, userColor;

  SignUpUser({required this.adminColor, required this.userColor});
}

final class SignUpAdmin extends SignUpState {
  final Color adminColor, userColor;

  SignUpAdmin({required this.adminColor, required this.userColor});
}
