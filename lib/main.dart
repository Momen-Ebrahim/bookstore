import 'package:bookstore/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:bookstore/simple_bloc_observer.dart';
import 'package:bookstore/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'RobotoSlab',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
<<<<<<< HEAD
        // home: const AdminNavigationBar(),
        // home: const UserNavigationBar(),
=======
>>>>>>> 47f1769b8636468b250d00101c381a77bc1e1e29
      ),
    );
  }
}
