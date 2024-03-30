import 'dart:developer';

import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/cubits/stripe/stripe_payment_cubit.dart';
import 'package:bookstore/models/amount_model/amount_model.dart';
import 'package:bookstore/models/amount_model/details.dart';
import 'package:bookstore/models/item_list_model/item.dart';
import 'package:bookstore/models/item_list_model/item_list_model.dart';
import 'package:bookstore/models/payment_intent_input_model.dart';
import 'package:bookstore/views/payment_method_item.dart';
import 'package:bookstore/views/payment_successful.dart';

import 'package:bookstore/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaymentDeteils extends StatefulWidget {
  const PaymentDeteils({super.key});

  @override
  State<PaymentDeteils> createState() => _PaymentDeteilsState();
}

int selectedPayment = 0;
bool isselected = false;

class _PaymentDeteilsState extends State<PaymentDeteils> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<String> payment = [
      'assets/images/svg/credit-card-6379.svg',
      'assets/images/svg/paypal.svg',
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedPayment = 0;
                      });
                    },
                    child: PaymentItem(
                      image: payment[0],
                      isSelected: selectedPayment == 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedPayment = 1;
                      });
                    },
                    child: PaymentItem(
                      image: payment[1],
                      isSelected: selectedPayment == 1,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   child: selectedPayment == 0
              //       ? CustomCrediCard(formKey: formKey)
              //       : null,
              // ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<StripePaymentCubit, StripePaymentState>(
                listener: (context, state) {
                  if (state is StripePaymenSuccess) {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const PaymentSuccess(),
                      ),
                    );
                  }
                  if (state is StripePaymentFailure) {
                    Navigator.of(context).pop();
                    SnackBar snackBar = const SnackBar(
                      content: Text('Payment Failed'),
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomButton(
                      color: Colors.black,
                      title: 'Pay',
                      isSeloading: state is StripePaymentLoading ? true : false,
                      onTap: () {
                        if (selectedPayment == 0) {
                          PaymentIntentInputModel paymentIntentInputModel =
                              PaymentIntentInputModel(
                                  amount: '500',
                                  currency: 'USD',
                                  customerId: 'cus_Pla7xlkvyee0gd');
                          BlocProvider.of<StripePaymentCubit>(context)
                              .makepayment(
                                  paymentIntentInputModel:
                                      paymentIntentInputModel);
                        } else if (selectedPayment == 1) {
                          var amount = AmountModel(
                              total: "500",
                              currency: "USD",
                              details: Details(
                                  subtotal: "500",
                                  shipping: "0",
                                  shippingDiscount: 0));
                          List<OrderItemModel> orders = [
                            OrderItemModel(
                                name: "Book1",
                                quantity: 1,
                                price: "250",
                                currency: "USD"),
                            OrderItemModel(
                                name: "Book2",
                                quantity: 1,
                                price: "250",
                                currency: "USD")
                          ];
                          var itemList = ItemListModel(orders: orders);
                          exceutePaypalPayment(context, amount, itemList);
                        }

                        // if (formKey.currentState!.validate()) {
                        //   formKey.currentState!.save();
                        // } else {
                        //   Navigator.push<void>(
                        //     context,
                        //     MaterialPageRoute<void>(
                        //       builder: (BuildContext context) =>
                        //           const PaymentSuccess(),
                        //     ),
                        //   );
                        // }
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void exceutePaypalPayment(
      BuildContext context, AmountModel amount, ItemListModel itemList) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const PaymentSuccess(),
            ),
          );
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          if (kDebugMode) {
            print('cancelled:');
          }
          Navigator.pop(context);
        },
      ),
    ));
  }
}

class CustomCrediCard extends StatefulWidget {
  const CustomCrediCard({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<CustomCrediCard> createState() => _CustomCrediCardState();
}

class _CustomCrediCardState extends State<CustomCrediCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          cardBgColor: Colors.black,
          chipColor: Colors.white,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
        ),
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (p0) {
              setState(() {
                cardNumber = p0.cardNumber;
                expiryDate = p0.expiryDate;
                cardHolderName = p0.cardHolderName;
                cvvCode = p0.cvvCode;
                showBackView = p0.isCvvFocused;
              });
            },
            formKey: widget.formKey)
      ],
    );
  }
}
