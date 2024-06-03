

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/data/network/network_api_services.dart';
import 'package:onboarding/data/response/status.dart';
import 'package:onboarding/modal/HistoryResponse.dart';
import 'package:onboarding/modal_view/HistoryRepository.dart';
import 'package:onboarding/utilts/Preference.dart';

class HistoryController extends GetxController{


  String show='';
  String status='';

  HistoryController(String show ,String status ){
    this.show=show;
    this.status=status;




  }


  var isLoading = true.obs;
  final api =HistoryRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final historyResponse=HistoryResponse().obs;
  String user_id="";
  //String status="";

  @override
  void onInit() {
    super.onInit();

    _getSharedPreferences();


  }

  void _getSharedPreferences() async
  {


    user_id=  Preference.shared?.getString(Preference.User_id)??"";

    historyfun(user_id,status);









  }



  Future historyfun(String user_id, String status) async{
    isLoading(true);
    update();

   // print("userId"+user_id);



    var map = new Map<String, dynamic>();
    map['user_id'] = user_id;
    map['status'] = status;



    api.historyInfo(map).then((value)
    {



      rxRequestStatus.value=Status.COMPLETED;
      historyResponse.value=value;

      print( "show history:"+historyResponse.value.toString());



      if(historyResponse!=null  ) {

        if(historyResponse.value.status==true) {



          // location_controller = TextEditingController(text:profileResponse.value.address.toString());
          // contactno_controller = TextEditingController(text: profileResponse.value.phone.toString());
          print("dkosdoksdkoskod");

          isLoading(false);

          update();



          ///  Get.offAll(OnBoardingScreen());


          //Navigator.push(Get.context!, MaterialPageRoute(builder: (context)=> OnBoardingScreen()));



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
        if(historyResponse.value.status==false) {


          print("xlscxsocxksxs");


          isLoading(false);
          update();
          Get.snackbar(
            historyResponse.value.message.toString(),
            "",
            backgroundColor:  Color(0xFF33DF92),


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


}