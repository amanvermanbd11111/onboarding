import 'package:flutter/material.dart';
import 'package:onboarding/screens/OnBoardingScreen.dart';
import 'package:get/get.dart';
import 'package:onboarding/utilts/Preference.dart';
import 'SplashScreen.dart';
import 'screens/ProfilesScreen.dart';
import 'screens/loginScreen.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {

    super.initState();





  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'OnBoarding App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      SplashScreen());
  }





}

