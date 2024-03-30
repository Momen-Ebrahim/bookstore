class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;
  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});
  tojson() {
    return {
      "amount": '${amount}00',
      "currency": currency,
      'customer': customerId
    };
  }
}
