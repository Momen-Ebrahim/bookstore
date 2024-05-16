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
import 'package:bookstore/cubits/sign_in/sign_in_cubit.dart';
import 'package:bookstore/cubits/sign_up/sign_up_cubit.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/simple_bloc_observer.dart';
import 'package:bookstore/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishablekey;

  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  await CacheNetwork.cacheInitialization();
  Bloc.observer = SimpleBlocObserver();

  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBarCubit>(
          create: (BuildContext context) => BottomNavigationBarCubit(),
        ),
        BlocProvider<GetallBooksCubit>(
          create: (BuildContext context) => GetallBooksCubit(),
        ),
        BlocProvider<GetonsaleBooksCubit>(
          create: (BuildContext context) => GetonsaleBooksCubit(),
        ),
        BlocProvider<GettopsellerBooksCubit>(
          create: (BuildContext context) => GettopsellerBooksCubit(),
        ),
        BlocProvider<GetnewarrivalBooksCubit>(
          create: (BuildContext context) => GetnewarrivalBooksCubit(),
        ),
        BlocProvider<GetupcomingBooksCubit>(
          create: (BuildContext context) => GetupcomingBooksCubit(),
        ),
        BlocProvider<GetCategoryBooksCubit>(
          create: (BuildContext context) => GetCategoryBooksCubit(),
        ),
        BlocProvider<GetsearchBooksCubit>(
          create: (BuildContext context) => GetsearchBooksCubit(),
        ),
        BlocProvider<GetBookidCubit>(
          create: (BuildContext context) => GetBookidCubit(),
        ),
        BlocProvider<GetFavoritesBooksCubit>(
          create: (BuildContext context) => GetFavoritesBooksCubit(),
        ),
        BlocProvider<GetownBooksCubit>(
          create: (BuildContext context) => GetownBooksCubit(),
        ),
        BlocProvider<GetmarksBooksCubit>(
          create: (BuildContext context) => GetmarksBooksCubit(),
        ),
        BlocProvider<AddToCartCubit>(
          create: (BuildContext context) => AddToCartCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (BuildContext context) => SignInCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'RobotoSlab',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
