import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:onboarding/utilts/AppColor.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(widgetHeight*.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Information',
                        style: TextStyle(
                          fontSize: textWidth*.07,
                          fontFamily: 'Montserrat',
                          color: AppColor.appColor
                        ),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: textWidth*.02),



                        // alignment: Alignment.topRight,



                        child: Icon( Icons.close,size: textWidth*.09,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: widgetHeight*.02),
                child: Text("Mobec Recycling is an e waste company, supporting objective for circular utilization on raw materials. ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: textWidth*.04,
                      fontFamily: 'Montserrat',
                      color: AppColor.blackcolor
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: widgetHeight*.02),
                child: Text("Mobec on boarding app is used for collecting important data regarding",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: textWidth*.035,
                      fontFamily: 'Montserrat',
                      color: AppColor.blackcolor
                  ),),
              ),

              Container(
                child: Text(""
                    "●  vendors on boarding  \n●  raw material information \n●  inventory listing",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: textWidth*.035,
                      fontFamily: 'Montserrat',
                      color: AppColor.blackcolor
                  ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: widgetHeight*.02),
                child: Text("Use:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                      fontSize: textWidth*.035,
                      fontFamily: 'Montserrat',
                      color: AppColor.blackcolor
                  ),),
              ),

              Container(
                child: Text(""
                    "● Open app  \n● Fill important credentials  \n● Click image of the Location \n● Proceed for confirmation and data review  \n● Earn points as per review \n● Cash out your points   ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: textWidth*.035,
                      fontFamily: 'Montserrat',
                      color: AppColor.blackcolor
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
