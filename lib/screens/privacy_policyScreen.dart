import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/OnBoardingController.dart';
import 'package:onboarding/utilts/AppColor.dart';


class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: SafeArea(
        child:
        GetBuilder<OnBoardingController>(
        init: OnBoardingController(),

    builder: (s) =>


        Stack(
          fit: StackFit.loose,
          children: [

            Container(
              padding: EdgeInsets.only(top: widgetHeight*.12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'When you use Mobec & its mobile apps, you trust us with your personal data. We’re committed to keeping that trust. That starts with helping you understand our privacy practices.'

                       ' This notice describes the personal data we collect, how it’s used and your choices regarding this data.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black54,
                            fontSize: textWidth*.045
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03
                      ,top:widgetHeight*.015),
                      child: Text(
                        'Definitions',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,
                            fontSize: textWidth*.055
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'Unless the context otherwise requires, or unless defined in the body of this Privacy Policy, the capitalized words and phrases used in this Privacy Policy shall have the meaning ascribed to such words and phrases in this section.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'MontserratAlternates',color: Colors.black54,
                            fontSize: textWidth*.045
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03
                          ,top:widgetHeight*.015),
                      child: Text(
                        'Account',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,
                            fontSize: textWidth*.055
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'Account shall have the meaning ascribed to the term in the T&C Agreement',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'MontserratAlternates',color: Colors.black54,
                            fontSize: textWidth*.045
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03
                          ,top:widgetHeight*.015),
                      child: Text(
                        'Application',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,
                            fontSize: textWidth*.055
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'Application shall have the meaning ascribed to the term in the T&C Agreement',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black54,
                            fontSize: textWidth*.05
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03
                          ,top:widgetHeight*.015),
                      child: Text(
                        'Cookie',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,
                            fontSize: textWidth*.055
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'Cookie shall mean the Trackers consisting of small sets of data stored in the Users browser',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'MontserratAlternates',color: Colors.black54,
                            fontSize: textWidth*.045
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03
                          ,top:widgetHeight*.015),
                      child: Text(
                        'Data Processor or Data Supervisor',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,
                            fontSize: textWidth*.055
                        ),
                      ),
                    ),
                    Container(

                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: Text(
                        'Data Processor or Data Supervisor shall mean the natural or legal person, agency or any other body which processes the Personal Data or the Usage Data on behalf of the controller',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'MontserratAlternates',color: Colors.black54,
                            fontSize: textWidth*.045
                        ),
                      ),
                    ),


                    Container(
                      alignment: Alignment.center,
                      //margin: EdgeInsets.only(top: widgetHeight*.04),
                      padding:  EdgeInsets.only(left:textWidth*.03),
                      child: InkWell(
                        onTap: (){
                          print("cmldoeodeode");

                          s.launchURLBrowser("https://mobec.io/privacy-policy");
                        },
                        child: Text(
                          'Read more (Web version)...',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,color: Colors.black,
                              fontSize: textWidth*.05
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: widgetHeight*.14,
              color: AppColor.whitecolor,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          margin: EdgeInsetsDirectional.all(20),
                          alignment: Alignment.centerRight,
                          child:
                          InkWell(
                              onTap: ()
                              {
                                Get.back();

                              },
                              child: Icon( Icons.arrow_back ,size:  MediaQuery.of(context).size.width*0.08,color:AppColor.blackcolor, )),
                        )
,


                        Expanded(child:Container(
                            margin: EdgeInsets.only(right: textWidth*.15),
                            child: Image.asset("assets/images/glow_e.png",height: widgetHeight*.07 ,)))

                      ],
                    ),
                  ),
                  Container(
                   //   width: textWidth*.15,
                      child: Text('Privacy policy', textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Montserrat',
                            fontWeight:FontWeight.w600,color: Colors.black,
                            fontSize: textWidth*.06
                        ),)
                  ),
                ],
              )
              ,),










          ],
        ),)
      ),
    );
  }
}
