import 'package:comptition_first_project/Helper/Database/cache_helper.dart';
import 'package:comptition_first_project/Routers/routes.dart';
import 'package:comptition_first_project/constants/keys.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? name;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      name = await CacheHelper.getData(key: nameKey);
      Navigator.pushReplacementNamed(
          context, name == null ? Routes.registerScreen : Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/mizan.png'),
          const Text(
            'ميزان',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                fontFamily: 'Gulzar'),
          ),
        ],
      ),
    );
  }
}
