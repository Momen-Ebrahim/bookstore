import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/core/api/dio_consumer.dart';
import 'package:bookstore/core/services/service_locator.dart';
import 'package:bookstore/core/utils/api_key.dart';
import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
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
