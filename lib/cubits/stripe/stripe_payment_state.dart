part of 'stripe_payment_cubit.dart';

@immutable
sealed class StripePaymentState {}

final class StripePaymentInitial extends StripePaymentState {}
final class StripePaymentLoading extends StripePaymentState {}

final class StripePaymenSuccess extends StripePaymentState {}
final class StripePaymentFailure extends StripePaymentState {
  final String errMessage;
  StripePaymentFailure( this.errMessage);
}


