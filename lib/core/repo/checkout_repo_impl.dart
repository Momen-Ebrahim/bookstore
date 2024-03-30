import 'package:bookstore/core/errors/failures.dart';
import 'package:bookstore/core/utils/stripe_service.dart';
import 'package:bookstore/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepo extends Checkfailure {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makepayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      return Left(Serverfailure(errMessage: e.toString()));
    }
  }
}
