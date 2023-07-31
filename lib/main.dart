import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping_app/screens/bloc/home_bloc.dart';

import 'package:shopping_app/view/splash_screen/splash_screen.dart';

void main() {
  // runApp(const MyApp());
    runApp(
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'shopping app',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily:'',
        ), 
        home: const SplashScreen(),
    );
  }
}

