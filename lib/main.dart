import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/core/api/dio_consumer.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/cubits/get_books/get_Category_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_newarrival_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_onsale_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_topseller%20-books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/get_upcoming_books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/search_books%20-%20Copy/get_books_cubit.dart';
import 'package:bookstore/cubits/user_cubit/user_cubit.dart';
import 'package:bookstore/simple_bloc_observer.dart';
import 'package:bookstore/splash_screen/splash_screen.dart';
import 'package:bookstore/views/user_nav_bar_m.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishablekey;

  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  Bloc.observer = SimpleBlocObserver();

  runApp(BlocProvider(
    create: (context) => UserCubit(DioConsumer(dio: Dio())),
    child: const BookStore(),
  ));
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
        BlocProvider<GetBooksCubit>(
          create: (BuildContext context) => GetBooksCubit(),
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
        ),BlocProvider<GetsearchBooksCubit>(
          create: (BuildContext context) => GetsearchBooksCubit(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'RobotoSlab',
          ),
          debugShowCheckedModeBanner: false,
          home: const UserNavigationBar()),
    );
  }
}
