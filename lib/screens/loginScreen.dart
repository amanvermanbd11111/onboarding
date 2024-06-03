import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/LoginController.dart';
import 'package:onboarding/controller/OnBoardingController.dart';
import 'package:onboarding/utilts/AppColor.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery
        .of(context)
        .size
        .height;
    double textWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
        child: Scaffold(
            body: GetBuilder<LoginController>(
                init: LoginController(),

                builder: (s) =>


                    Center(
                      child: SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: textWidth * .02,
                              vertical: widgetHeight * .01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: const VerticalDivider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Login', style: TextStyle(
                                                color: AppColor.appColor,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat',
                                                fontSize: textWidth * .07
                                            ),),
                                          ),


                                          Container(
                                            padding: EdgeInsets.only(
                                              top: widgetHeight * .06,
                                              left: textWidth * .04,
                                              // bottom: widgetHeight*.1
                                            ),
                                            child: Text("Phone",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: textWidth * .04,
                                                    fontFamily: 'Montserrat')),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: textWidth * .04,
                                              right: textWidth * .04,
                                              //  top: widgetHeight*.05
                                              //bottom: widgetHeight*.1
                                            ),
                                            child: Container(
                                              //height: widgetHeight*.1,
                                              child: TextFormField(
                                                maxLength: 10,
                                                keyboardType: TextInputType
                                                    .phone,
                                                scrollPadding: EdgeInsets.only(
                                                    bottom: MediaQuery
                                                        .of(context)
                                                        .viewInsets
                                                        .bottom),
                                                style: TextStyle(
                                                    fontSize: textWidth * .03),
                                                controller:
                                                s.phone_controller,
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                  // errorText: s.errorText,
                                                  // errorStyle: TextStyle(fontSize: textWidth*.02),

                                                  hintText: '',
                                                  isDense: true,
                                                  // important line
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      textWidth * .02,
                                                      widgetHeight * .02,
                                                      0,
                                                      widgetHeight * .02),
                                                  // control your hints text size
                                                  border: InputBorder.none,
                                                  counterText: '',

                                                  filled: true,
                                                  fillColor: Colors.white,

                                                  // contentPadding:
                                                  //  EdgeInsets.only(

                                                  //     left: textWidth*.02,
                                                  //  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: widgetHeight * .03,
                                              left: textWidth * .04,
                                            ),
                                            child: Text("Password",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: textWidth * .04,
                                                    fontFamily: 'Montserrat')),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: textWidth * .04,
                                              right: textWidth * .04,
                                              //  top: widgetHeight*.05
                                              //bottom: widgetHeight*.1
                                            ),
                                            child: Container(
                                              child: TextFormField(
                                                obscureText: true,
                                                scrollPadding: EdgeInsets.only(
                                                    bottom: MediaQuery
                                                        .of(context)
                                                        .viewInsets
                                                        .bottom),
                                                style: TextStyle(
                                                    fontSize: textWidth * .03),
                                                controller: s
                                                    .password_controller,
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                  // errorText: s.errorText,
                                                  // errorStyle: TextStyle(fontSize: textWidth*.02),

                                                  hintText: '',
                                                  isDense: true,
                                                  // important line
                                                  contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      textWidth * .02,
                                                      widgetHeight * .02,
                                                      0,
                                                      widgetHeight * .02),
                                                  // control your hints text size
                                                  border: InputBorder.none,
                                                  counterText: '',

                                                  filled: true,
                                                  fillColor: Colors.white,

                                                  // contentPadding:
                                                  //  EdgeInsets.only(

                                                  //     left: textWidth*.02,
                                                  //  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                    BorderRadius.circular(10.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),


                                          Container(
                                            margin: EdgeInsets.only(
                                                top: widgetHeight * .05,
                                                bottom: widgetHeight * .1),
                                            alignment: Alignment.center,
                                            child:

                                            s.isLoading.value ?

                                            Container(

                                              margin: EdgeInsets.only(
                                                  top: widgetHeight * .01,
                                                  bottom: widgetHeight * .1
                                              ),


                                              //  margin: EdgeInsets.only(top: 10),
                                              child: const Center(
                                                  child: SizedBox(
                                                    child: CircularProgressIndicator(
                                                      color: AppColor.appColor,
                                                    ),
                                                  )),
                                            ) :

                                            InkWell(
                                              onTap: () {
                                               s.User_Login_fun();

                                               FocusScope.of(context).requestFocus(new FocusNode());



                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Colors.greenAccent),
                                                height: widgetHeight * .06,
                                                width: textWidth * .35,
                                                child: Text(
                                                  "Login", style: TextStyle(
                                                  // fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: textWidth * .05
                                                ),),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: const VerticalDivider(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: const Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
            )));
  }




}
