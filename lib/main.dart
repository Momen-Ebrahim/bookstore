import 'package:bookstore/simple_bloc_observer.dart';
import 'package:bookstore/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SofiaProBold'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
