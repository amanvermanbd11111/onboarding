import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/OnBoardingController.dart';
import 'package:onboarding/screens/contactUsScreen.dart';
import 'package:onboarding/screens/history.dart';
import 'package:onboarding/screens/infoScreen.dart';
import 'package:onboarding/screens/loginScreen.dart';
import 'package:onboarding/screens/privacy_policyScreen.dart';
import 'package:onboarding/utilts/AppColor.dart';
import 'package:onboarding/utilts/Preference.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(


        ///extendBodyBehindAppBar: false,


        body:


        GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
    builder: (s) =>


    s.isLoading1.value?



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
    )

        :





    SingleChildScrollView(

          child: Container(

              alignment: Alignment.centerLeft,


              margin: EdgeInsets.symmetric(vertical: textWidth*.05,horizontal: widgetHeight*.02),


            child: Column(
              //

              //  mainAxisSize: MainAxisSize.min,
              //  mainAxisAlignment: MainAxisAlignment.end
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children:[



                    Container(

                      child: Divider(
                        color: Colors.black,
                       indent: 10,
                        endIndent: 10,




                        thickness: 2,


                      ),
                    ),




                Container(

                  alignment: Alignment.center,


             //   color: Colors.red,
                //  width: 2000,

                //  width: double.infinity,



               //   height: 500,


                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Container(

                        height:widgetHeight*.88,



                        child: const IntrinsicHeight(


                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.black,


                          ),
                        ),
                      ),



                      Column(


                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,





                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,


                        children: [


                          Container(
                            width: textWidth-textWidth*.2,
                            alignment:Alignment.center,
                            child: Row(

                              crossAxisAlignment: CrossAxisAlignment.center,

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,




                              children: [

                                Container(



                                  //alignment: Alignment.center,



                                  child: Icon( Icons.account_circle_sharp,size: textWidth*.09,),
                                ),
                                Container(


                                   // alignment: Alignment.center,





                                    child:
                                    Text("FSE Profile info",

                                                    style: TextStyle(
                              //color: Color.fromRGBO(90, 224, 163, 1),

                              color:Color(0xFF33DF92),

                              fontFamily: "Montserrat",
                              fontSize: textWidth * 0.05,
                              fontWeight: FontWeight.w400),
                                                  )
                                    )
                                ,
                                InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Container(



                                    // alignment: Alignment.topRight,



                                    child: Icon( Icons.close,size: textWidth*.09,),
                                  ),
                                ),


                              ],
                            ),
                          ),



                          Container(

                            alignment: Alignment.centerLeft,



                            margin: EdgeInsets.only(top: widgetHeight * .02),

                            child: Text("FSE ID : ${s.user_id}",

                              style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Montserrat",
                                  fontSize:textWidth* 0.04,

                                  fontWeight: FontWeight.w400),


                               ),
                          ),


                          Container(

                            alignment: Alignment.centerLeft,



                            margin: EdgeInsets.only(top: widgetHeight * .02),


                            child: Text("Name : ${s.profileResponse.value?.name??""}",

                              style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Montserrat",
                                  fontSize:textWidth* 0.04,

                                  fontWeight: FontWeight.w400),


                            ),
                          ),
                          Container(

                            alignment: Alignment.centerLeft,



                            margin: EdgeInsets.only(top: widgetHeight * .02),

                            child: Text("Area of Execution : ${s.profileResponse.value?.address??""}",

                              style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Montserrat",
                                  fontSize:textWidth* 0.04,

                                  fontWeight: FontWeight.w400),


                            ),
                          ),
                          Container(

                            alignment: Alignment.centerLeft,



                            margin: EdgeInsets.only(top: widgetHeight * .02),

                            child: Text("Email : ${s.profileResponse.value?.address??""}",

                              style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Montserrat",
                                  fontSize:textWidth* 0.04,

                                  fontWeight: FontWeight.w400),


                            ),
                          ),
                          Container(

                            alignment: Alignment.centerLeft,

                            margin: EdgeInsets.only(top: widgetHeight * .02),



                            child: Text("Contact no : ${s.profileResponse.value?.phone??""}",

                              style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Montserrat",
                                  fontSize:textWidth* 0.04,

                                  fontWeight: FontWeight.w400),


                            ),
                          ),




                          Container(
                            width: textWidth*.8,
                            alignment: Alignment.center,


                            child: Row(


                              crossAxisAlignment: CrossAxisAlignment.center,


                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [

                                Column(
                                  children: [

                                    Container(

                                      alignment: Alignment.centerLeft,



                                      margin: EdgeInsets.only(top: widgetHeight * .05),


                                      child: Text("Reviewed",


                                        style: TextStyle(
                                            color:Colors.black,
                                            fontFamily: "Montserrat",
                                            fontSize:textWidth* 0.03,

                                            fontWeight: FontWeight.w400),


                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){

                                        Get.to(HistoryScreen(show: "Reviewed",status: "1",));
                                      },
                                      child: Container(

                                        padding: EdgeInsets.all(25),


                                        alignment: Alignment.centerLeft,

                                                                         //   margin: EdgeInsets.only(top: 10,left: 8,right: 8),


                                        margin: EdgeInsets.only(top: widgetHeight * .01,left: widgetHeight * .01,right: widgetHeight * .01),


                                        decoration: BoxDecoration(


                                          borderRadius: BorderRadius.circular(14),
                                            border: Border.all(


                                              color: Color.fromRGBO(115, 181, 69, 1),



                                              width: 4.0,

                                            )
                                        ),




                                        child: Text("${s.profileResponse.value?.totalReceived??""}",

                                          style: TextStyle(
                                              color:Colors.green,
                                              fontFamily: "Montserrat",
                                              fontSize:textWidth* 0.06,

                                              fontWeight: FontWeight.w600),


                                        ),
                                      ),
                                    ),






                                  ],
                                ),


                                Column(
                                  children: [

                                    Container(

                                      alignment: Alignment.centerLeft,



                                      margin: EdgeInsets.only(top: widgetHeight * .05),



                                      child: Text("In Review",


                                        style: TextStyle(
                                            color:Colors.black,
                                            fontFamily: "Montserrat",
                                            fontSize:textWidth* 0.03,

                                            fontWeight: FontWeight.w400),


                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        Get.to(HistoryScreen(show: "In Review",status: "2",));

                                      },
                                      child: Container(

                                        padding: EdgeInsets.all(25),


                                        alignment: Alignment.centerLeft,

                                        margin: EdgeInsets.only(top: widgetHeight * .01,left: widgetHeight * .01,right: widgetHeight * .01),



                                        decoration: BoxDecoration(


                                            borderRadius: BorderRadius.circular(14),
                                            border: Border.all(


                                              color: Color.fromRGBO(66, 112, 193, 1),



                                              width:4.0,

                                            )
                                        ),




                                        child: Text("${s.profileResponse.value?.totalInReview??""}",


                                          style: TextStyle(
                                              color: Color.fromRGBO(66, 112, 193, 1),
                                              fontFamily: "Montserrat",
                                              fontSize:textWidth* 0.06,

                                              fontWeight: FontWeight.w600),


                                        ),
                                      ),
                                    ),






                                  ],
                                ),


                                Column(
                                  children: [

                                    Container(

                                      alignment: Alignment.centerLeft,



                                      margin: EdgeInsets.only(top: widgetHeight * .05),


                                      child: Text("Rejected",


                                        style: TextStyle(
                                            color:Colors.black,
                                            fontFamily: "Montserrat",
                                            fontSize:textWidth* 0.03,

                                            fontWeight: FontWeight.w400),


                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        Get.to(HistoryScreen(show: "Rejected",status: "3",));

                                      },
                                      child: Container(

                                        padding: EdgeInsets.all(25),


                                        alignment: Alignment.centerLeft,

                                        margin: EdgeInsets.only(top: widgetHeight * .01,left: widgetHeight * .01,right: widgetHeight * .01),



                                        decoration: BoxDecoration(


                                            borderRadius: BorderRadius.circular(14),
                                            border: Border.all(


                                              color: Color.fromRGBO(253, 4, 4, 1),

                                              width: 4.0,

                                            )
                                        ),




                                        child: Text("${s.profileResponse.value?.totalRejected??""}",


                                          style: TextStyle(
                                              color: Color.fromRGBO(253, 4, 4, 1),
                                              fontFamily: "Montserrat",
                                              fontSize:textWidth* 0.06,

                                              fontWeight: FontWeight.w600),


                                        ),
                                      ),
                                    ),






                                  ],
                                ),

                              ],
                            ),
                          )
,


                          GestureDetector(
                            onTap: (){

                              Get.to(()=>InfoScreen());
                            },
                            child: Container(
                                                     //   color: Colors.green,

                              margin: EdgeInsets.only(top: widgetHeight * .06),

                              child: Row(

                                crossAxisAlignment: CrossAxisAlignment.center
                                ,

                              mainAxisAlignment: MainAxisAlignment.spaceAround,



                                children: [



                                  Icon(Icons.info_outline,size:  textWidth*.08,)
                                  ,


                                  Container(

                                    alignment: Alignment.center,



                                    margin: EdgeInsets.only(left:  textWidth*.04),



                                    child: Text("Info",

                                      textAlign: TextAlign.center,



                                      style: TextStyle(
                                          color:Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize:textWidth* 0.04,

                                          fontWeight: FontWeight.w400),


                                    ),
                                  )
                                ],


                              ),
                            ),
                          )


                          ,


                          GestureDetector(
                            onTap: (){

                              s.launchURLBrowser("https://www.mobec.io/contact_us_users.php");


                            },
                            child: Container(
                              //   color: Colors.green,

                              margin: EdgeInsets.only(top: widgetHeight * .02),




                              child: Row(

                                crossAxisAlignment: CrossAxisAlignment.center
                                ,

                                mainAxisAlignment: MainAxisAlignment.spaceAround,



                                children: [



                                  Icon(Icons.help_outline,size:  textWidth*.08,)
                                  ,


                                  Container(

                                    alignment: Alignment.center,



                                    margin: EdgeInsets.only(left:  textWidth*.04),



                                    child: Text("Help",

                                      textAlign: TextAlign.center,



                                      style: TextStyle(
                                          color:Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize:textWidth* 0.04,

                                          fontWeight: FontWeight.w400),


                                    ),
                                  ),
                                ],


                              ),
                            ),
                          )


                          ,


                          GestureDetector(
                            onTap:(){

                              Get.to(() => PrivacyPolicy());
                            },
                            child: Container(

                              margin: EdgeInsets.only(top: widgetHeight * .02),




                              child: Row(

                                crossAxisAlignment: CrossAxisAlignment.center
                                ,

                                mainAxisAlignment: MainAxisAlignment.spaceAround,



                                children: [



                                  Icon(Icons.local_police,size: textWidth*.08,)
                                  ,


                                  Container(

                                    alignment: Alignment.center,



                                    margin: EdgeInsets.only(left:  textWidth*.04),



                                    child: Text("Policies",


                                      textAlign: TextAlign.center,



                                      style: TextStyle(
                                          color:Colors.black,
                                          fontFamily: "Montserrat",
                                          fontSize:textWidth* 0.04,

                                          fontWeight: FontWeight.w400),


                                    ),
                                  ),
                                ],


                              ),
                            ),
                          )

                          ,





                          Container(



                            width:  textWidth*.8,
                             margin: EdgeInsets.only(top:  textWidth*.20),


                          //  alignment: Alignment.bottomCenter,
                            child:


                            Container(

                              child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF33DF92),

                                     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),


                                  onPressed:(){
                                    Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
                                    Get.offAll(LoginScreen());



                                  }, child:Text("Logout",


                                  textAlign: TextAlign.center,



                                  style: TextStyle(
                                      color:Colors.black,
                                      fontFamily: "Montserrat",
                                      fontSize:textWidth* 0.04,

                                      fontWeight: FontWeight.w400),


                                ),),
                            ),
                          )








                        ],
                      )


,






                      //
                      Container(

                       height:widgetHeight*.88,







                        //  height: 500,


                        child: IntrinsicHeight(


                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.black,


                          ),
                        ),
                      ),



                    ],



                  ),
                ),




                Container(

                  child: Divider(
                    color: Colors.black,

                    indent: 10,
                    endIndent: 10,


                    thickness: 2,


                  ),
                ),

              ]


            )

          ),
        ),
        )
      ),
    );
  }
}
