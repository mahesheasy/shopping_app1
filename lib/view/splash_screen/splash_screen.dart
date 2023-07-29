import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:shopping_app/consts/consts.dart';

import '../../screens/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change the screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      Get.to(() => const Homepage());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: golden,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(icApplogo,
                height: 80, width: 80, alignment: Alignment.center),
            const SizedBox(
              height: 10,
            ),
            const Text(appname),
            const SizedBox(
              height: 10,
            ),
            const Text(appversion),
            const Spacer(),
            const Text(credits),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
