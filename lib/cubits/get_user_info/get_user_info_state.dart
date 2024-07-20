part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final GetUserInfoModel response;

  GetUserInfoSuccess({required this.response});
}

final class GetUserInfoFailure extends GetUserInfoState {}
