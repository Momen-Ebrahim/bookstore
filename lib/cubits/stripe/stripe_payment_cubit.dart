import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bookstore/core/errors/failures.dart';
import 'package:bookstore/models/payment_intent_input_model.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());
  final Checkfailure checkoutRepo;
  Future makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var data = await checkoutRepo.makepayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) => emit(StripePaymentFailure(l.errMessage)),
        (r) => emit(StripePaymenSuccess()));
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
