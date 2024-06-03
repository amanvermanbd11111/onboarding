import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onboarding/data/response/status.dart';
import 'package:onboarding/modal/ContactUsResponse.dart';
import 'package:onboarding/modal_view/ContactUSRepository.dart';
import 'package:onboarding/utilts/AppColor.dart';

class ContactUsController extends GetxController{


  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var isLoading = false.obs;
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;


  final contactUsResponse=ContactUsResponse().obs;
  String name="";
  String email="";

  String phone="";


  String message="";





  final api =ContactUSRepository();
  void sendMessageFun() async{

    isLoading(true);
    update();

    var map = new Map<String, dynamic>();
    map['type']="user";
    map['name']=name.toString();
    map['email']=email.toString();
    map['phone']=phone.toString();
    map['message']=message.toString();

    api.sendFeedback(map).then((value) {
      rxRequestStatus.value=Status.COMPLETED;
      contactUsResponse.value=value;



      if(contactUsResponse.value!=null) {
        if (contactUsResponse.value.status == true) {
          isLoading(false);

          update();


          Get.snackbar(
            // user_login_response.value.message.toString(),
            "Message sent successfully",


            "",
            backgroundColor: AppColor.appColor,
            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,



          );
          // Get.offAll(FeatureDiscovery(
          //   recordStepsInSharedPreferences: false,
          //   child: MyHomeScreen(),
          // ));
          //Get.back();


        } else {

          Get.snackbar(
            // user_login_response.value.message.toString(),
            "Something went wrong",

            "",
            backgroundColor: AppColor.appColor,


            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,



          );
        }
      }

      else{

        Get.snackbar(
          // user_login_response.value.message.toString(),
          "Something went wrong",

          "",
          backgroundColor: AppColor.appColor,


          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,



        );
      }
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
    });

  }

}