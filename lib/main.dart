import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/cubits/get_books/book_id/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_Category_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_onsale_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_topseller%20-books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_upcoming_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_user_Bookmarks_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_user_fav_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_user_own__books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/search_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_user_info/get_user_info_cubit.dart';
import 'package:bookstore/cubits/sign_in/sign_in_cubit.dart';
import 'package:bookstore/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookstore/cubits/update_user_profile/update_user_profile_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/simple_bloc_observer.dart';
import 'package:bookstore/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishablekey;

  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  await CacheNetwork.cacheInitialization();
  Bloc.observer = SimpleBlocObserver();

  CacheHelper cacheHelper = getIt<CacheHelper>();
  String? savedLocale = cacheHelper.getLocale();
  Locale initialLocale =
      savedLocale != null ? Locale(savedLocale) : const Locale('en', 'US');

  runApp(BookStore(initialLocale: initialLocale));
}

class BookStore extends StatefulWidget {
  const BookStore({super.key, required this.initialLocale});

  final Locale initialLocale;

  @override
  State<BookStore> createState() => _BookStoreState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _BookStoreState state = context.findAncestorStateOfType<_BookStoreState>()!;
    state.setLocale(newLocale);
  }
}

class _BookStoreState extends State<BookStore> {
  late CacheHelper cacheHelper;

  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
    cacheHelper = getIt<CacheHelper>();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
      cacheHelper.saveLocale(locale.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      
      ],
      child: MaterialApp(
        locale: _locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          fontFamily: 'Rubik-Variable',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
