import 'package:bookstore/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class Checkfailure {
  Future<Either<Failure, void>> makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class Serverfailure extends Failure {
  Serverfailure({required super.errMessage});
}
