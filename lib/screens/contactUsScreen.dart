import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onboarding/utilts/AppColor.dart';

import '../controller/ContactUsController.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GetBuilder<ContactUsController>(
              init: ContactUsController(),
              builder: (s) => SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottom),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.all(20),
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: MediaQuery.of(context).size.width *
                                        0.08,
                                    color: Colors.black,
                                  )),
                            ),
                            Expanded(
                                child: Container(
                                    margin:
                                    EdgeInsets.only(right: textWidth * .15),
                                    child: Image.asset(
                                      "assets/images/mobec_glow.png",
                                      height: widgetHeight * .07,
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/mobec_blue.png",
                          height: widgetHeight * .1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: textWidth * .02, top: widgetHeight * .05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: textWidth * .02,
                              ),
                              child: Text(
                                'Contact us',
                                style: TextStyle(
                                    fontSize: textWidth * .07,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: widgetHeight * .02),
                              child: TextFormField(
                                controller: s.nameController,
                                focusNode: s.fieldOne,
                                style:TextStyle(fontSize: textWidth*.05) ,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(s.fieldTwo);
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  helperStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: textWidth * .05,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: textWidth * .05,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: textWidth * .04,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: widgetHeight * .02),
                              child: TextFormField(
                                style:TextStyle(fontSize: textWidth*.05) ,
                                controller: s.emailController,
                                focusNode: s.fieldTwo,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(s.fieldThree);
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: textWidth * .05,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: textWidth * .04,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: widgetHeight * .02),
                              child: TextFormField(
                                style:TextStyle(fontSize: textWidth*.05) ,
                                controller: s.phoneController,
                                focusNode: s.fieldThree,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(s.fieldFour);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: textWidth * .05,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: textWidth * .04,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: widgetHeight * .02),
                              child: TextFormField(
                                style:TextStyle(fontSize: textWidth*.05) ,
                                controller: s.messageController,
                                focusNode: s.fieldFour,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Message',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: textWidth * .05,
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: textWidth * .04,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            s.isLoading.value
                                ? Container(
                              margin: EdgeInsets.only(
                                  top: widgetHeight * .05,
                                  bottom: widgetHeight * .05),
                              child: const Center(
                                  child: SizedBox(
                                    child: CircularProgressIndicator(
                                      color: Colors.green,
                                    ),
                                  )),
                            )
                                : Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: widgetHeight * .05),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  print("send message");

                                  print("Proceed");

                                  // if(s.emailController.text.toString().isEmail){
                                  //   print("email valid");
                                  // }else{
                                  //   print("email invalid");
                                  //
                                  // }

                                  if ((s.nameController.text.toString() ==
                                      "")) {
                                    Get.snackbar(
                                      // user_login_response.value.message.toString(),

                                      "Please fill the name",
                                      "",
                                      backgroundColor:
                                      AppColor.appColor,

                                      forwardAnimationCurve:
                                      Curves.easeOutBack,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else if ((s.emailController.text
                                      .toString() ==
                                      "")) {
                                    Get.snackbar(
                                      // user_login_response.value.message.toString(),

                                      "Please fill the email",
                                      "",
                                      backgroundColor:
                                      AppColor.appColor,

                                      forwardAnimationCurve:
                                      Curves.easeOutBack,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else if (!(s.emailController.text
                                      .toString()
                                      .isEmail)) {
                                    Get.snackbar(
                                      // user_login_response.value.message.toString(),

                                      "Please fill vaild email",
                                      "",
                                      backgroundColor:
                                      AppColor.appColor,

                                      forwardAnimationCurve:
                                      Curves.easeOutBack,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else if ((s.phoneController.text
                                      .toString() ==
                                      "")) {
                                    Get.snackbar(
                                      // user_login_response.value.message.toString(),

                                      "Please fill the phone number",
                                      "",
                                      backgroundColor:
                                      AppColor.appColor,

                                      forwardAnimationCurve:
                                      Curves.easeOutBack,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else if ((s.messageController.text
                                      .toString() ==
                                      "")) {
                                    Get.snackbar(
                                      // user_login_response.value.message.toString(),

                                      "Please fill the message",
                                      "",
                                      backgroundColor:
                                      AppColor.appColor,

                                      forwardAnimationCurve:
                                      Curves.easeOutBack,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  } else {
                                    s.name =
                                        s.nameController.text.toString();
                                    s.email =
                                        s.emailController.text.toString();
                                    s.phone =
                                        s.phoneController.text.toString();
                                    s.message = s.messageController.text
                                        .toString();

                                    s.isLoading(true);
                                    s.sendMessageFun();
                                    s.nameController.clear();
                                    s.emailController.clear();
                                    s.phoneController.clear();
                                    s.messageController.clear();
                                    s.update();
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: widgetHeight * .05,
                                  width: textWidth * .4,
                                  decoration: BoxDecoration(
                                      color: AppColor.blackcolor,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Send message',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: textWidth * .04,
                                        fontFamily: 'Montserrat',
                                        color: AppColor.whitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
