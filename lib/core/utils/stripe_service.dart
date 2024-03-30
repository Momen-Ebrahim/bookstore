import 'dart:async';

import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/core/utils/api_service.dart';
import 'package:bookstore/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:bookstore/models/intent_payment_input_model.dart';
import 'package:bookstore/models/payment_intent_input_model.dart';

import 'package:bookstore/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createpaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.tojson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.scretkey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
            merchantDisplayName: 'Ebook Store',
            customerEphemeralKeySecret:
                initiPaymentSheetInputModel.ephemeralKeySecret,
            customerId: initiPaymentSheetInputModel.customerId));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makepayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createpaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await creatEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var initiPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initiPaymentSheetInputModel: initiPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> creatEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        contentType: Headers.formUrlEncodedContentType,
        token: ApiKeys.scretkey,
        headers: {
          "Authorization": "Bearer ${ApiKeys.scretkey}",
          "Stripe-Version": "2023-10-16"
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
