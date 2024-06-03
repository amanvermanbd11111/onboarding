import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/HistoryController.dart';

import '../utilts/AppColor.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key,required this.show,required this.status});
  final String show ;
  final String status ;


  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        
        body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(widgetHeight*.02),
                      child: InkWell(
                        onTap: (){
                          print("object");
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Image.asset("assets/images/closeimg.jpeg",height: widgetHeight*.04,)
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.show,style: TextStyle(
                    fontSize: textWidth*.07,
                    fontFamily: 'Montserrat'
                  ),
                  ),
                ),
                GetBuilder<HistoryController>(
                    init: HistoryController(widget.show,widget.status),
            
                    builder: (s) =>
            
            
                        Container(
                          margin: EdgeInsets.only(top: widgetHeight*.01),
            
                          child:
            
            
                          s.isLoading.value ?
                          Container(
            
                            margin: EdgeInsets.only(
            
                                top : widgetHeight*.02,
                                bottom: widgetHeight*.02),
            
            
                            child: const
            
            
            
                            Center(child:
            
            
            
            
            
            
                            SizedBox(
            
                              child:
            
                              CircularProgressIndicator(
            
                                color:   Colors.green,



                              ),
            
            
            
                            )),
                          ):
            
            
            
                          Container(
                            height: widgetHeight*.85,
                            child: ListView.builder(
                                shrinkWrap: true,


                                  physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: s.historyResponse.value.data?.length??0,

                               // itemCount: 5,

                                itemBuilder: (context,index){



                                  double widgetHeight = MediaQuery.of(context).size.height;
                                  double textWidth = MediaQuery.of(context).size.width;

                                  return




                                    Container(
                                      padding: EdgeInsets.only(
                                        top: widgetHeight*.02,
                                        bottom:widgetHeight*.01),
                                      margin: EdgeInsets.all(widgetHeight*.02),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),color: Colors.grey.shade300,
                                      ),
                                      //  height: widgetHeight*.56,

                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: textWidth * .02),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Onbording ID ',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].onboardingId.toString()??""
                                                            ,
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Name of vendor ',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                          s.historyResponse.value.data?[index].name.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Location ',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,
                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].location.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Contact no ',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].contactNumber.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Inventory',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].inventory.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      'Inventory Capacity per month (tones) ',
                                                      style: TextStyle(
                                                          fontSize: textWidth * .025,
                                                          fontFamily: 'Montserrat'),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: textWidth*.02),
                                                    child: Text(
                                                      textAlign: TextAlign.right,

                                                      overflow: TextOverflow.fade,
                                                      /// model.name.toString(),

                                                      // s.user_profiles_detailes?.value
                                                      //         ?.data?.name
                                                      //         .toString() ??

                                                      s.historyResponse.value.data?[index].invPerMonth.toString()??"",
                                                      style: TextStyle(
                                                          fontSize: textWidth * .025,
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily: 'Montserrat'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'FSE',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].fsc.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Date ',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].date.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Medium',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        s.historyResponse.value.data?[index].medium.toString()??"",
                                                        style: TextStyle(
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: widgetHeight * .005),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Status',
                                                    style: TextStyle(
                                                        fontSize: textWidth * .025,
                                                        fontFamily: 'Montserrat'),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: textWidth * .05),
                                                      child: Text(
                                                        textAlign: TextAlign.right,

                                                        /// model.name.toString(),

                                                        // s.user_profiles_detailes?.value
                                                        //         ?.data?.name
                                                        //         .toString() ??

                                                        widget.show,
                                                        //s.historyResponse.value.data?[index].medium.toString()??"",
                                                        style: TextStyle(
                                                          color: widget.show =="Reviewed"?Colors.green: widget.show == "In Review"?Colors.blue :Colors.red ,
                                                            fontSize: textWidth * .025,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),
                                    )





                                  ;


                                }),
                          ),
                        )
            
            
            
            
                ),
              ],
            ),
          )
      ),
    );
  }

}