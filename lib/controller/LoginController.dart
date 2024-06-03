

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/data/network/network_api_services.dart';
import 'package:onboarding/data/response/status.dart';
import 'package:onboarding/modal/LoginResponse.dart';
import 'package:onboarding/modal_view/LoginRepository.dart';
import 'package:onboarding/screens/OnBoardingScreen.dart';
import 'package:onboarding/utilts/Preference.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginController extends GetxController{



  var isLoading = false.obs;


  final api =LoginRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final user_login_response=LoginResponse().obs;


  TextEditingController phone_controller = TextEditingController();

  TextEditingController password_controller = TextEditingController();




  @override
  void onInit() {
    super.onInit();
    double? x;



    mycheckfunction();



    print("mdmooeodoewdodoew");




  }











  void User_Login_fun() async{
    isLoading(true);
    update();



    var map = new Map<String, dynamic>();
    map['phone'] = phone_controller.text.toString();
    map['password'] = password_controller.text.toString();


    api.User_Login_Api(map).then((value)
    {



      rxRequestStatus.value=Status.COMPLETED;
      user_login_response.value=value;

      print( "myfinalResponse:"+user_login_response.value.message.toString());



      if(user_login_response!=null  ) {

        if(user_login_response.value.status==true) {



          phone_controller.clear();
          password_controller.clear();


          print("dkosdoksdkoskod");

          isLoading(false);

          update();
          Preference.shared?.setBool(Preference.IS_USER_FIRSTTIME, false);


          Preference.shared.setString(Preference.User_id,user_login_response.value.userId.toString());

        ///  Get.offAll(OnBoardingScreen());


          //Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));
          Navigator.push(
            Get.context!,
            MaterialPageRoute(builder: (context) =>  OnBoardingScreen()),
          );


          //
          //
          // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          //
          //
          // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
          //












          //Get.to(() => Verification());



        }






        else
        if(user_login_response.value.status==false) {


          print("xlscxsocxksxs");


          isLoading(false);
          update();
          Get.snackbar(
            user_login_response.value.message.toString(),
            "",
            backgroundColor: const Color(0xFF33DF92),


            forwardAnimationCurve: Curves.easeOutBack,

            snackPosition: SnackPosition.BOTTOM,



          );


        }
      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: const Color(0xFF33DF92),
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,
        );




      }




    }

    )
        .onError((error, stackTrace)
    {







      isLoading(false);

      update();


      print("d,ldldwdwdwdpwpd");

      // Get.snackbar(
      //   error.toString(),
      //   "",
      //   backgroundColor: const Color(0xFF33DF92),
      //   forwardAnimationCurve: Curves.easeOutBack,
      //   snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //
      // );

      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    }

    );



  }




  String? get errorText {
    // at any time, we can get the text from _controller.value.text
    final text =phone_controller.text.toString();

    // if (text.isEmpty) {
    //   return 'Can\'t be empty';
    // }
    //



    ////  pradeep

    if (text.length < 10) {


      return 'Please fill the 10 digit number';

    }

    // return null if the text is valid

    return null;
  }




  @override
  void onClose() {

       super.onClose();
    print("loginclosed");

    phone_controller.clear();
    password_controller.clear();



  }





  Future<void> mycheckfunction() async {

    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      // Permission.notification,
      //add more permission to request here.
    ].request();

    if(statuses[Permission.camera]!.isDenied){ //check each permission status after.
      print("Location permission is denied.");
    }

    // if(statuses[Permission.notification]!.isDenied){ //check each permission status after.
    //   print("Camera permission is denied.");
    // }

  }



  @override
  void dispose() {

    super.dispose();

    print("loginclosed2");



    phone_controller.clear();
    password_controller.clear();


  }







}