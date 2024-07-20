import 'dart:convert';
import 'dart:developer';
import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/cubits/stripe/stripe_payment_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
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
import 'package:http/http.dart' as http;

class PaymentDeteils extends StatefulWidget {
  const PaymentDeteils({super.key, required this.prise, required this.bookIds});
  final int prise;
  final List<String> bookIds;
  @override
  State<PaymentDeteils> createState() => _PaymentDeteilsState();
}

int selectedPayment = 0;
bool isselected = false;

class _PaymentDeteilsState extends State<PaymentDeteils> {
  Future<void> postBookData(List<String> bookIds) async {
    String apiUrl = 'https://book-store-api-mu.vercel.app/User/Books';

    Map<String, dynamic> body = {
      "bookids": bookIds,
    };

    String encodedBody = json.encode(body);

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheNetwork.getCacheData(key: 'token')}',
      },
      body: encodedBody,
    );

    if (response.statusCode == 200) {
      for (var i = 0; i < widget.bookIds.length; i++) {
        await Api().delete(
          url:
              'https://book-store-api-mu.vercel.app/User/Bookmarks/${widget.bookIds[i]}',
          token: CacheNetwork.getCacheData(key: 'token'),
        );
      }
      if (kDebugMode) {
        print("Post successful!");
        print("Response: ${response.body}");
      }

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => PaymentSuccess(
            price: widget.prise.toString(),
          ),
        ),
      );
    } else {
      if (kDebugMode) {
        print("Failed to post. Status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    }
  }

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
                    postBookData(
                      widget.bookIds,
                    );
                  }
                  if (state is StripePaymentFailure) {
                    Navigator.of(context).pop();
                    SnackBar snackBar = SnackBar(
                      content: Text(S.of(context).PaymentFailed),
                      duration: const Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomButton(
                      color: Colors.black,
                      title: S.of(context).pay,
                      isSeloading: state is StripePaymentLoading ? true : false,
                      onTap: () {
                        if (selectedPayment == 0) {
                          PaymentIntentInputModel paymentIntentInputModel =
                              PaymentIntentInputModel(
                                  amount: widget.prise.toString(),
                                  currency: 'USD',
                                  customerId: 'cus_Pla7xlkvyee0gd');
                          BlocProvider.of<StripePaymentCubit>(context)
                              .makepayment(
                                  paymentIntentInputModel:
                                      paymentIntentInputModel);
                        } else if (selectedPayment == 1) {
                          var amount = AmountModel(
                              total: widget.prise.toString(),
                              currency: "USD",
                              details: Details(
                                  subtotal: widget.prise.toString(),
                                  shipping: "0",
                                  shippingDiscount: 0));
                          List<OrderItemModel> orders = [
                            OrderItemModel(
                                name: "Book1",
                                quantity: 1,
                                price: widget.prise.toString(),
                                currency: "USD"),
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
          postBookData(widget.bookIds);
          log("onSuccess: $params");
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => PaymentSuccess(
                price: widget.prise.toString(),
              ),
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
