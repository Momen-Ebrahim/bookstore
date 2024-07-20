// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `See All`
  String get SeeAll {
    return Intl.message(
      'See All',
      name: 'SeeAll',
      desc: '',
      args: [],
    );
  }

  /// `Offers & Deals`
  String get OffersandDeals {
    return Intl.message(
      'Offers & Deals',
      name: 'OffersandDeals',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get NewArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'NewArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get ComingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'ComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get BestSeller {
    return Intl.message(
      'Best Seller',
      name: 'BestSeller',
      desc: '',
      args: [],
    );
  }

  /// `All Books`
  String get AllBooks {
    return Intl.message(
      'All Books',
      name: 'AllBooks',
      desc: '',
      args: [],
    );
  }

  /// `Delete from Cart`
  String get DeletefromCart {
    return Intl.message(
      'Delete from Cart',
      name: 'DeletefromCart',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get AddtoCart {
    return Intl.message(
      'Add to Cart',
      name: 'AddtoCart',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get BuyNow {
    return Intl.message(
      'Buy Now',
      name: 'BuyNow',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get Comments {
    return Intl.message(
      'Comments',
      name: 'Comments',
      desc: '',
      args: [],
    );
  }

  /// `Rate this Book ...`
  String get RatethisBook {
    return Intl.message(
      'Rate this Book ...',
      name: 'RatethisBook',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment ...`
  String get AddComment {
    return Intl.message(
      'Add Comment ...',
      name: 'AddComment',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Find your book`
  String get Findyourbook {
    return Intl.message(
      'Find your book',
      name: 'Findyourbook',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `No book found`
  String get Nobookfound {
    return Intl.message(
      'No book found',
      name: 'Nobookfound',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Fiction`
  String get Fiction {
    return Intl.message(
      'Fiction',
      name: 'Fiction',
      desc: '',
      args: [],
    );
  }

  /// `Non-fiction`
  String get NonFiction {
    return Intl.message(
      'Non-fiction',
      name: 'NonFiction',
      desc: '',
      args: [],
    );
  }

  /// `Fantasy`
  String get Fantasy {
    return Intl.message(
      'Fantasy',
      name: 'Fantasy',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Classics`
  String get Classics {
    return Intl.message(
      'Classics',
      name: 'Classics',
      desc: '',
      args: [],
    );
  }

  /// `Mystery`
  String get Mystery {
    return Intl.message(
      'Mystery',
      name: 'Mystery',
      desc: '',
      args: [],
    );
  }

  /// `Crime`
  String get Crime {
    return Intl.message(
      'Crime',
      name: 'Crime',
      desc: '',
      args: [],
    );
  }

  /// `Horror`
  String get Horror {
    return Intl.message(
      'Horror',
      name: 'Horror',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get OrderSummary {
    return Intl.message(
      'Order Summary',
      name: 'OrderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to Checkout`
  String get ProceedtoCheckout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'ProceedtoCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get Yourcartisempty {
    return Intl.message(
      'Your cart is empty',
      name: 'Yourcartisempty',
      desc: '',
      args: [],
    );
  }

  /// `My Books `
  String get yourbooks {
    return Intl.message(
      'My Books ',
      name: 'yourbooks',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Logout {
    return Intl.message(
      'Log out',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Favourite Books`
  String get FavouriteBooks {
    return Intl.message(
      'Favourite Books',
      name: 'FavouriteBooks',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get AccountSettings {
    return Intl.message(
      'Account Settings',
      name: 'AccountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Update Information`
  String get UpdateInformation {
    return Intl.message(
      'Update Information',
      name: 'UpdateInformation',
      desc: '',
      args: [],
    );
  }

  /// `Please fill your details to update.`
  String get Pleasefillyour {
    return Intl.message(
      'Please fill your details to update.',
      name: 'Pleasefillyour',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Reading Offline`
  String get ReadingOffline {
    return Intl.message(
      'Reading Offline',
      name: 'ReadingOffline',
      desc: '',
      args: [],
    );
  }

  /// `Reading books at anytime anywhere, save your time and data!`
  String get Readingbooksatanytime {
    return Intl.message(
      'Reading books at anytime anywhere, save your time and data!',
      name: 'Readingbooksatanytime',
      desc: '',
      args: [],
    );
  }

  /// `Search & Purchase`
  String get SearchPurchase {
    return Intl.message(
      'Search & Purchase',
      name: 'SearchPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Find the perfect book for and discover new ones that interest you`
  String get Findtheperfectbook {
    return Intl.message(
      'Find the perfect book for and discover new ones that interest you',
      name: 'Findtheperfectbook',
      desc: '',
      args: [],
    );
  }

  /// `Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!`
  String get readmorethan {
    return Intl.message(
      'Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!',
      name: 'readmorethan',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message(
      'Get Started',
      name: 'GetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Please fill your details to login.`
  String get Pleasefillyourdetails {
    return Intl.message(
      'Please fill your details to login.',
      name: 'Pleasefillyourdetails',
      desc: '',
      args: [],
    );
  }

  /// `New member ?  `
  String get Newmember {
    return Intl.message(
      'New member ?  ',
      name: 'Newmember',
      desc: '',
      args: [],
    );
  }

  /// `Please fill your details to signup.`
  String get Pleasefillyourdetailstosignup {
    return Intl.message(
      'Please fill your details to signup.',
      name: 'Pleasefillyourdetailstosignup',
      desc: '',
      args: [],
    );
  }

  /// `Already a member ?  `
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already a member ?  ',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message(
      'SignIn',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get PaymentFailed {
    return Intl.message(
      'Payment Failed',
      name: 'PaymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get PaymentSuccessful {
    return Intl.message(
      'Payment Successful',
      name: 'PaymentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for your purchase`
  String get Thankyouforyourpurchase {
    return Intl.message(
      'Thank you for your purchase',
      name: 'Thankyouforyourpurchase',
      desc: '',
      args: [],
    );
  }

  /// `Date:`
  String get Date {
    return Intl.message(
      'Date:',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Time:`
  String get Time {
    return Intl.message(
      'Time:',
      name: 'Time',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get Totall {
    return Intl.message(
      'Total:',
      name: 'Totall',
      desc: '',
      args: [],
    );
  }

  /// `PAID`
  String get PAID {
    return Intl.message(
      'PAID',
      name: 'PAID',
      desc: '',
      args: [],
    );
  }

  /// `OFF`
  String get OFF {
    return Intl.message(
      'OFF',
      name: 'OFF',
      desc: '',
      args: [],
    );
  }

  /// `Type your message`
  String get Typeyourmessage {
    return Intl.message(
      'Type your message',
      name: 'Typeyourmessage',
      desc: '',
      args: [],
    );
  }

  /// `filter by`
  String get filterby {
    return Intl.message(
      'filter by',
      name: 'filterby',
      desc: '',
      args: [],
    );
  }

  /// `sort by highest price`
  String get sortbyhighestprice {
    return Intl.message(
      'sort by highest price',
      name: 'sortbyhighestprice',
      desc: '',
      args: [],
    );
  }

  /// `sort by lowest price`
  String get sortbylowestprice {
    return Intl.message(
      'sort by lowest price',
      name: 'sortbylowestprice',
      desc: '',
      args: [],
    );
  }

  /// `sort by oldest books`
  String get sortbyoldestbooks {
    return Intl.message(
      'sort by oldest books',
      name: 'sortbyoldestbooks',
      desc: '',
      args: [],
    );
  }

  /// `sort by newest books`
  String get sortbynewestbooks {
    return Intl.message(
      'sort by newest books',
      name: 'sortbynewestbooks',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
