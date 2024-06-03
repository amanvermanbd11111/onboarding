import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_selector/widget/flutter_multi_select.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/OnBoardingController.dart';
import 'package:onboarding/screens/ProfilesScreen.dart';
import 'package:multiselect/multiselect.dart';
import 'package:onboarding/utilts/AppColor.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height;
    double textWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: GetBuilder<OnBoardingController>(
              init: OnBoardingController(),
              builder: (s) =>




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
              )

                  :

              SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: textWidth * .02,
                          vertical: widgetHeight * .01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Divider(
                              thickness: 2,
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
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(ProfilesScreen());
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: textWidth * .04),
                                                child: Icon(
                                                  Icons.account_circle_sharp,
                                                  size: widgetHeight * .05,
                                                )),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: textWidth * .04),
                                            child: Text("Today's work done: ${s.profileResponse.value?.totalInReviewToday??"0"}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Montserrat",
                                              fontSize: textWidth*.03
                                            ),),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: widgetHeight * .03,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Onboarding ID",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            readOnly: true,
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller:
                                                s.onBoardingid_controller,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                        ),
                                        child: Text("Name of vendor",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller: s.nameVendor_controller,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Location",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            readOnly: true,
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller: s.location_controller,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Flat/House no./Building",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller:
                                                s.flatHouseBuilding_controller,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              // errorText: s.errorText,
                                              // errorStyle: TextStyle(fontSize: textWidth*.02),

                                              hintText: '(Optional)',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Contact no",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller: s.contactno_controller,
                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Inventory",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
                                                fontFamily: 'Montserrat')),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //     left: textWidth * .04,
                                      //     right: textWidth * .04,
                                      //     //  top: widgetHeight*.05
                                      //     //bottom: widgetHeight*.1
                                      //   ),
                                      //   child: Container(
                                      //     child: TextFormField(
                                      //       scrollPadding: EdgeInsets.only(
                                      //           bottom: MediaQuery.of(context)
                                      //               .viewInsets
                                      //               .bottom),
                                      //       style: TextStyle(
                                      //           fontSize: textWidth * .03),
                                      //       controller: s.inventory_controller,
                                      //       cursorColor: Colors.black,
                                      //       decoration: InputDecoration(
                                      //         // errorText: s.errorText,
                                      //         // errorStyle: TextStyle(fontSize: textWidth*.02),
                                      //
                                      //         hintText: '',
                                      //         isDense: true,
                                      //         // important line
                                      //         contentPadding:
                                      //             EdgeInsets.fromLTRB(
                                      //                 textWidth * .02,
                                      //                 widgetHeight * .02,
                                      //                 0,
                                      //                 widgetHeight * .02),
                                      //         // control your hints text size
                                      //         border: InputBorder.none,
                                      //         counterText: '',
                                      //
                                      //         filled: true,
                                      //         fillColor: Colors.white,
                                      //
                                      //         // contentPadding:
                                      //         //  EdgeInsets.only(
                                      //
                                      //         //     left: textWidth*.02,
                                      //         //  ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderSide: BorderSide(
                                      //               color: Colors.blue),
                                      //           borderRadius:
                                      //               BorderRadius.circular(10.0),
                                      //         ),
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderSide: BorderSide(
                                      //               color: Colors.black),
                                      //           borderRadius:
                                      //               BorderRadius.circular(10.0),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //         left: textWidth * .04,
                                      //         right: textWidth * .04,
                                      //         ),
                                      //   child: DropDownMultiSelect(
                                      //     decoration: InputDecoration(
                                      //       fillColor: Theme.of(context).colorScheme.onPrimary,
                                      //       focusColor: Theme.of(context).colorScheme.onPrimary,
                                      //       enabledBorder:  const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //           borderSide: BorderSide(
                                      //               color: Colors.black,
                                      //
                                      //           )),
                                      //       focusedBorder: const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //           borderSide: BorderSide(
                                      //             color:Colors.blue,
                                      //
                                      //           )),
                                      //     ),
                                      //     options: s.Inventory,
                                      //     selectedValues: s.selectedCheckBoxValue,
                                      //     onChanged: (List<String> value) {
                                      //       //   value = selectedCheckBoxValue;
                                      //       print("${s.selectedCheckBoxValue}");
                                      //
                                      //     },
                                      //     whenEmpty: 'Select ',
                                      //   ),
                                      // ),




                                      Container(
                                        margin: EdgeInsets.only(
                                          left: textWidth * .04,
                                          right: textWidth * .04,
                                        ),
                                        child: CustomMultiSelectField<String>(
                                          title: "Select",
                                          items: s.Inventory,
                                          enableAllOptionSelect: true,
                                          onSelectionDone:
                                              s.onInventorySelectionComplete,
                                          selectedItemColor: Colors.black,
                                          itemAsString: (item) =>
                                              item.toString(),
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text(
                                            "Inventory Capacity per month (tones)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            keyboardType: TextInputType.number,
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller:
                                                s.inventoryCapacity_controller,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("FSE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            readOnly: true,
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller: s.fse_controller,
                                            cursorColor: Colors.black,
                                            keyboardType: TextInputType.number,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          // bottom: widgetHeight*.01
                                        ),
                                        child: Text("Date",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
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
                                            readOnly: true,
                                            scrollPadding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            style: TextStyle(
                                                fontSize: textWidth * .03),
                                            controller: s.date_controller,
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
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          //bottom: widgetHeight*.01
                                        ),
                                        child: Text("Medium",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
                                                fontFamily: 'Montserrat')),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //     left: textWidth * .04,
                                      //     right: textWidth * .04,
                                      //     //  top: widgetHeight*.05
                                      //     //bottom: widgetHeight*.1
                                      //   ),
                                      //   child: Container(
                                      //     //height: widgetHeight*.1,
                                      //     child: TextFormField(
                                      //       scrollPadding: EdgeInsets.only(
                                      //           bottom: MediaQuery.of(context)
                                      //               .viewInsets
                                      //               .bottom),
                                      //       style: TextStyle(
                                      //           fontSize: textWidth * .03),
                                      //       controller: s.medium_controller,
                                      //       cursorColor: Colors.black,
                                      //       decoration: InputDecoration(
                                      //         // errorText: s.errorText,
                                      //         // errorStyle: TextStyle(fontSize: textWidth*.02),
                                      //
                                      //         hintText: '',
                                      //         isDense: true,
                                      //         // important line
                                      //         contentPadding:
                                      //             EdgeInsets.fromLTRB(
                                      //                 textWidth * .02,
                                      //                 widgetHeight * .02,
                                      //                 0,
                                      //                 widgetHeight * .02),
                                      //         // control your hints text size
                                      //         border: InputBorder.none,
                                      //         counterText: '',
                                      //
                                      //         filled: true,
                                      //         fillColor: Colors.white,
                                      //
                                      //         // contentPadding:
                                      //         //  EdgeInsets.only(
                                      //
                                      //         //     left: textWidth*.02,
                                      //         //  ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderSide: BorderSide(
                                      //               color: Colors.blue),
                                      //           borderRadius:
                                      //               BorderRadius.circular(10.0),
                                      //         ),
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderSide: BorderSide(
                                      //               color: Colors.black),
                                      //           borderRadius:
                                      //               BorderRadius.circular(10.0),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),

                                      /////
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //     left: textWidth * .04,
                                      //     right: textWidth * .04,
                                      //   ),
                                      //   child: DropDownMultiSelect(
                                      //     decoration: InputDecoration(
                                      //       fillColor: Theme.of(context).colorScheme.onPrimary,
                                      //       focusColor: Theme.of(context).colorScheme.onPrimary,
                                      //       enabledBorder:  const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //           borderSide: BorderSide(
                                      //             color: Colors.black,
                                      //
                                      //           )),
                                      //       focusedBorder: const OutlineInputBorder(
                                      //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //           borderSide: BorderSide(
                                      //             color:Colors.blue,
                                      //
                                      //           )),
                                      //     ),
                                      //     options: s.Medium,
                                      //     selectedValues: s.selectedCheckBoxValue1,
                                      //     onChanged: (List<String> value) {
                                      //       //   value = selectedCheckBoxValue;
                                      //       print("${s.selectedCheckBoxValue1}");
                                      //
                                      //     },
                                      //     whenEmpty: 'Select ',
                                      //   ),
                                      // ),

                                      Container(
                                        margin: EdgeInsets.only(
                                          left: textWidth * .04,
                                          right: textWidth * .04,
                                        ),
                                        child: CustomMultiSelectField<String>(
                                          title: "Select",
                                          items: s.Medium,
                                          enableAllOptionSelect: true,
                                          onSelectionDone:
                                              s.onMediumSelectionComplete,
                                          selectedItemColor: Colors.black,
                                          validator: (value) {
                                            print(
                                                "valueasdf" + value.toString());
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          itemAsString: (item) =>
                                              item.toString(),
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(
                                          top: widgetHeight * .01,
                                          left: textWidth * .04,
                                          //bottom: widgetHeight*.01
                                        ),
                                        child: Text("Image",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textWidth * .03,
                                                fontFamily: 'Montserrat')),
                                      ),
                                      s.image != null
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: widgetHeight * .02),
                                              alignment: Alignment.center,
                                              // height: widgetHeight * .1,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                fit: StackFit.passthrough,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      print("lsxosdwsdw");
                                                    },
                                                    child: Image.file(
                                                      s.image!,
                                                      width: widgetHeight * .15,
                                                      height:
                                                          widgetHeight * .15,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: InkWell(
                                                        onTap: () {
                                                          s.image = null;
                                                          s.update();

                                                          //
                                                          // s.image=null;
                                                          // s.update();
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ],
                                              ))
                                          : Container(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () {
                                                  s.getImageFromCamera();
                                                },
                                                child: Container(
                                                  width: textWidth * .2,
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.camera_alt,
                                                    size: widgetHeight * .07,
                                                  ),
                                                ),
                                              ),
                                            ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: widgetHeight * .02,
                                            bottom: widgetHeight * .02),
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () {
                                            if ((s.nameVendor_controller.text
                                                    .toString() ==
                                                "")) {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please fill the Name",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            } else if (s
                                                    .contactno_controller.text
                                                    .toString() ==
                                                "") {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please fill the Contact no.",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            } else if (s.selectedCheckBoxValue
                                                .isEmpty) {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please select  the Inventory",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            } else if (s
                                                    .inventoryCapacity_controller
                                                    .text
                                                    .toString() ==
                                                "") {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please fill the Inventory Capacity",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            }
                                            else if (s
                                                .contactno_controller
                                                .text.toString().length<10
                                               ) {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please enter correct phone number",
                                                "",
                                                backgroundColor:
                                                AppColor.appColor,

                                                forwardAnimationCurve:
                                                Curves.easeOutBack,
                                                snackPosition:
                                                SnackPosition.TOP,
                                              );
                                            }else if (s.selectedCheckBoxValue1
                                                .isEmpty) {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "Please select  the Medium",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            } else if (s.image == null) {
                                              Get.snackbar(
                                                // user_login_response.value.message.toString(),

                                                "No image Selected, Please Click on Camera",
                                                "",
                                                backgroundColor:
                                                    AppColor.appColor,

                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            }

                                            else {

                                              confirmDialog(

                                                  textWidth, widgetHeight, s);


                                              }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.greenAccent),
                                            height: widgetHeight * .05,
                                            width: textWidth * .25,
                                            child: Text("Next"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: const VerticalDivider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: const Divider(
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }

  Future confirmDialog(
      double textWidth, double widgetHeight, OnBoardingController s) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
                content:

                SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    child: StatefulBuilder(// You need this, notice the parameters below:
                        builder: (BuildContext context, StateSetter setState) {
                                return Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                  
                        // height: 150,
                       // height: MediaQuery.of(context).size.height * .63,
                  
                        child: Padding(
                          padding: EdgeInsets.all(widgetHeight * .01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: widgetHeight * .06,
                                      bottom: widgetHeight * .02),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Onboarding Successful',
                                    style: TextStyle(
                                        color: Color(0xFF33DF92),
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        fontSize: textWidth * .04),
                                  )),
                              Container(
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
                  
                                                s.onBoardingid_controller.text
                                                    .toString(),
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
                  
                                                s.nameVendor_controller.text
                                                    .toString(),
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
                                                  s.flatHouseBuilding_controller.text.toString()==''?s.location_controller.text.toString():s.flatHouseBuilding_controller.text.toString()+" , "+s.location_controller.text.toString()
                  
                                               // s.flatHouseBuilding_controller.text.toString()+"  "+ s.location_controller.text
                                               //      .toString()
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
                  
                                                s.contactno_controller.text
                                                    .toString(),
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
                  
                                                s.inventory_controller.text
                                                    .toString(),
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

                                              s.inventoryCapacity_controller
                                                  .text
                                                  .toString(),
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
                  
                                                s.fse_controller.text.toString(),
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
                  
                                                s.date_controller.text.toString(),
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
                  
                                                s.medium_controller.text
                                                    .toString(),
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
                  
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: widgetHeight * .02,
                                    left: textWidth * .02,
                                    right: textWidth * .02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex:3,
                                      child: InkWell(
                                        onTap: () {
                                          print("1");
                                          Get.back();
                                        },
                                        child: Container(
                                          height: widgetHeight * .06,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xFF33DF92)),
                                          child: Text(
                                            'Change info details',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w600,
                                                fontSize: textWidth * .03),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: textWidth * .03,
                                    ),
                  
                  
                  
                  
                  
                  
                                    // s.isLoading2.value
                  
                  
                  
                  
                                    Obx(
                                    () =>
                                     s.isLoading2.value
                                        ? Expanded(
                                       flex: 3,
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: widgetHeight * .01,
                                                  bottom: widgetHeight * .01),
                  
                                              //  margin: EdgeInsets.only(top: 10),
                                              child: const Center(
                                                  child: SizedBox(
                                                child: CircularProgressIndicator(
                                                  color: AppColor.appColor,
                                                ),
                                              )),
                                            ),
                                        )
                                        : Expanded(
                                       flex: 3,
                                          child: InkWell(
                                              onTap: () {
                                                print("2");
                                                s.uploadImageToServer();
                  
                                                //finalDialog(textWidth,widgetHeight,s);
                                              },
                                              child: Container(
                                                height: widgetHeight * .06,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Color(0xFF33DF92)),
                                                child: Text(
                                                  'Confirm',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: textWidth * .03),
                                                ),
                                              ),
                                            ),
                                        )
                  
                  
                                    )
                  
                                  ],
                                ),
                              ),
                  
                              Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap:  ()async {
                                Uri phoneno =
                                Uri.parse('tel:9818040605');
                                if (await launchUrl(phoneno)) {
                                //dialer opened

                                } else {

                                //dailer is not opened
                                }

                                //  launch(data[2].toString());

                                // otpDialogBox(widgetHeight, textWidth);
                                },
                                  child: Container(
                                    width: textWidth * .2,
                                    margin: EdgeInsets.only(top: widgetHeight * .03),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          size: widgetHeight * .04,
                                        ),
                                        Text(
                                          "Help",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              fontSize: textWidth * .03),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -widgetHeight * .04,
                        left: textWidth * .26,
                        child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/checklist.png",
                              height: widgetHeight * .1,
                            )),
                      )
                    ],
                                );
                              }),
                  ),
                )),
          );
        });
  }

  Future finalDialog(
      double textWidth, double widgetHeight, OnBoardingController s) {
    return showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            //this right here
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              children: [
                Container(
                  alignment: Alignment.topCenter,

                  // height: 150,
                  height: MediaQuery.of(context).size.height * .43,

                  child: Padding(
                    padding: EdgeInsets.all(widgetHeight * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: widgetHeight * .06,
                                bottom: widgetHeight * .02),
                            alignment: Alignment.center,
                            child: Text(
                              'Details Confirmed',
                              style: TextStyle(
                                  color: Color(0xFF33DF92),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: textWidth * .04),
                            )),
                        Container(
                          child: Text(
                            'Onboarding details are confirmed and are under review.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: textWidth * .03),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: widgetHeight * .02),
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Press ',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: textWidth * .04)),
                                TextSpan(
                                  text: 'OK to go Home',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      fontSize: textWidth * .04),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: widgetHeight * .04,
                              bottom: widgetHeight * .04),
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              Get.back();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                              height: widgetHeight * .05,
                              width: textWidth * .25,
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: textWidth * .04,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Giving false information more than 2 times will result in legal concerns',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: textWidth * .025),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -widgetHeight * .05,
                  left: textWidth * .3,
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/checklist.png",
                        height: widgetHeight * .08,
                      )),
                )
              ],
            ),
          );
        });
  }
}
