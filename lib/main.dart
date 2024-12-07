import 'package:fit_check_app/bloc/bloc_observer.dart';
import 'package:fit_check_app/bloc/bmi_cubit.dart';
import 'package:fit_check_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  runApp(BlocProvider(
    create: (context) => BmiCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
