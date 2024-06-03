import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onboarding/screens/OnBoardingScreen.dart';
import 'package:onboarding/screens/loginScreen.dart';
import 'package:onboarding/utilts/Preference.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  bool isFirstTimeUser = true;

  @override
  void initState() {

    isFirstTime();
    Timer(Duration(seconds: 5), () {


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return (isFirstTimeUser) ?

      LoginScreen() :

      OnBoardingScreen();




      }));
    });
    super.initState();

  }



  isFirstTime() async {

    isFirstTimeUser = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) ?? true;
    print("isfirstimes"+ isFirstTimeUser.toString());

  }




  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:

        Container(

          color: Colors.white,

          child: Center(
              child: Image.asset("assets/images/splashScreen.png",
                //height: widgetHeight*.3,
              )),

          //Image.asset("assets/images/compsplesh.gif" ,height: MediaQuery.of(context).size.height, fit: BoxFit.cover,),

        ),
      ),
    );
  }
}