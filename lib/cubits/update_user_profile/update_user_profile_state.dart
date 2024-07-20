part of 'update_user_profile_cubit.dart';

@immutable
sealed class UpdateUserProfileState {}

final class UpdateUserProfileInitial extends UpdateUserProfileState {}

final class UpdateUserProfileLoading extends UpdateUserProfileState {}

final class UpdateUserProfileSuccess extends UpdateUserProfileState {}

final class UpdateUserProfileFailure extends UpdateUserProfileState {}
