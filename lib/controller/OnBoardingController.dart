import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/data/network/network_api_services.dart';
import 'package:onboarding/data/response/status.dart';
import 'package:onboarding/modal/LoginResponse.dart';
import 'package:onboarding/modal/ProfileResponse.dart';
import 'package:onboarding/modal_view/OnboardingRepository.dart';
import 'package:intl/intl.dart';
import 'package:onboarding/screens/OnBoardingScreen.dart';
import 'package:onboarding/utilts/Preference.dart';


import 'dart:io';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';


class OnBoardingController extends GetxController
{
  var isLoading = true.obs;
  var isLoading1 = true.obs;
  var isLoading2 = false.obs;


  String user_id="";
  String currentDate="";


  final api =OnboardingRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final profileResponse=ProfileResponse().obs;

  TextEditingController onBoardingid_controller = TextEditingController();
  TextEditingController nameVendor_controller = TextEditingController();
  TextEditingController location_controller = TextEditingController();
  TextEditingController flatHouseBuilding_controller = TextEditingController();


  TextEditingController contactno_controller = TextEditingController();

  TextEditingController inventory_controller = TextEditingController();

  TextEditingController inventoryCapacity_controller = TextEditingController();

  TextEditingController fse_controller = TextEditingController();

  TextEditingController date_controller = TextEditingController();

  TextEditingController medium_controller = TextEditingController();

  File? image;

  List<String> Inventory = ['LFP',"Aluminium","NMC","LCO","Copper","Iron","Plastic"];
  List<dynamic> selectedCheckBoxValue = [];

  List<String> Medium = ['In person',"Social media","Trade"];
  List<dynamic> selectedCheckBoxValue1 = [];

  @override
  Future<void> onInit() async {
    super.onInit();

    _getSharedPreferences();
   ///_checkGps();
  //  getUserCurrentLocation();




    // var counter = 3;
    // Timer.periodic(const Duration(seconds: 2), (timer) {
    //   print(timer.tick);
    //   counter--;
    //   if (counter == 0) {
    //     print('Cancel timer');
    //     timer.cancel();
    //   }
    // });

    //mycheckfunction();
    random();
   // await determinePosition();



  }
  void random(){
    var rndnumber="MOBEC";
    var rnd= new Random();
    for (var i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    onBoardingid_controller = TextEditingController(text: rndnumber);
    print(rndnumber);
  }
  Future _checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      //if (!mounted) return;
      if (Theme.of(Get.context!!).platform == TargetPlatform.android) {
        showDialog(
          context:Get. context!!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Can't get current location"),
              content:
              const Text('Your GPS is turn off, please turn it on first.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Turn On'),
                  onPressed: () async {



                     // AndroidIntent intent = AndroidIntent(
                     //    action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                  //  await intent.launch();
               //     if (!mounted) return;
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }









  Future<Position> getUserCurrentLocation() async {

    await Geolocator.requestPermission().then((value) async {

      print("ncdicdicdicidncd");


      Position aaa = await Geolocator.getCurrentPosition();
      // current_lat= aaa.latitude;
      // current_lang = aaa.longitude;


      List<Placemark>placemarks = await placemarkFromCoordinates(
          aaa.latitude, aaa.longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      var Address = '${place.street}, ${place.subLocality}, ${place
          .locality} , ${place.postalCode}, ${place.country}';
      //
      //
      // address_Type.value = Preference.shared.getString(Preference.ADDRESSTYPE) ?? 'Current Location';
      // full_Address.value = Preference.shared.getString(Preference.FULLADDRESS) ?? Address;
      //








      // Future.delayed(Duration(seconds: 1));
      // {
      // markers.add(
      //     Marker(
      //       markerId: MarkerId("current"),
      //       position: LatLng(aaa.latitude, aaa.longitude),
      //       infoWindow: InfoWindow(
      //         title: 'My Current Location',
      //       ),
      //     )
      //
      //
      // );






      ////////   this is working code
      //
      //
      // mapController?.animateCamera(CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //         target: LatLng(aaa.latitude, aaa.longitude), zoom: 14)));
      //





      //   }


      // update();


    }).onError((error, stackTrace) async {

      await Geolocator.requestPermission();

      print("ERROR" + error.toString());


    });


    print("check1");

    return await Geolocator.getCurrentPosition().whenComplete(() {


      print("check2");



      determinePosition();

    }
    );


  }


  Future determinePosition() async {
    //
    // isLoading(true);
    // update();


    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();


    if (!serviceEnabled) {

      print("dmlwqdlwomdw");




      return await Geolocator.getCurrentPosition().whenComplete(() {


        print("check2");


        determinePosition();

      });


     // await Geolocator.getCurrentPosition();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        // isLoading(false);
        // update();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // isLoading(false);
      // update();
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }





    final currentLocation = await Geolocator.getCurrentPosition();











    List<Placemark>placemarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    var Address = '${place.street}, ${place.subLocality}, ${place.locality} , ${place.postalCode}, ${place.country}';

    location_controller = TextEditingController(text: Address);

    // isLoading(false);
    update();

    print("Othersssss"+  place.street.toString());









  }



  void onInventorySelectionComplete(value) {

    selectedCheckBoxValue.clear();


    if(value.toString().length>2)
    {
      selectedCheckBoxValue.addAll(value);
      print("selectedCheckBoxValue = "+selectedCheckBoxValue.toString());
      inventory_controller= TextEditingController(text:selectedCheckBoxValue.toString() );





    }







  }

  void onMediumSelectionComplete(value) {


    selectedCheckBoxValue1.clear();
    if(value.toString().length>2)
      {




        selectedCheckBoxValue1.addAll(value);
        medium_controller= TextEditingController(text:selectedCheckBoxValue1.toString() );




      }



  }


  Future<void> getImageFromCamera() async {

    print("lmdsdosod");



    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera,
      imageQuality: 50,
    );


      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
      update();






  }

  Future<void> uploadImageToServer() async {

    isLoading2(true);
    update();

    if (image == null) {
      print('No image selected.');
      return;
    }

    final url = Uri.parse('https://www.mobec.io/mobec_onboarding/index.php');
    final request = http.MultipartRequest('POST', url);



    //
    // onboarding_id
    // name
    // location
    // contact_number
    // inventory
    // inv_per_month
    // fsc
    // date
    // medium


    request.fields['user_id'] = user_id;
    request.fields['onboarding_id'] = onBoardingid_controller.text.toString();

    request.fields['name'] = nameVendor_controller.text.toString();



   // request.fields['location'] = flatHouseBuilding_controller.text.toString()+" , "+location_controller.text.toString();

    request.fields['location'] = flatHouseBuilding_controller.text.toString()==''?location_controller.text.toString():flatHouseBuilding_controller.text.toString()+" , "+location_controller.text.toString();

    request.fields['contact_number'] = contactno_controller.text.toString();

    request.fields['inventory'] = inventory_controller.text.toString();


    request.fields['inv_per_month'] = inventoryCapacity_controller.text.toString();

    request.fields['fsc'] = fse_controller.text.toString();

    request.fields['date'] = date_controller.text.toString();

    request.fields['medium'] = medium_controller.text.toString();
    request.fields['status'] = '2';


    request.files.add(await http.MultipartFile.fromPath('sendimage', image!.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        isLoading2(false);
        Get.back();
        finalDialog(Get.width, Get.height);



        update();

        print('Image uploaded successfully.');


      } else {

        isLoading2(false);
        update();

        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {

      isLoading2(false );
      update();

      print('Error uploading image: $error');
    }
  }

  Future finalDialog(
      double textWidth, double widgetHeight) {
    return showDialog(
      barrierDismissible: false,
      // barrierDismissible: false,
        context: Get.context!,
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
                          margin: EdgeInsets.only(top: widgetHeight*.02),
                          alignment: Alignment.center,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Press ',style:TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: textWidth * .04)),
                                TextSpan(
                                  text: 'OK to go Home',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Montserrat",
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


                              // onBoardingid_controller.clear();
                              // nameVendor_controller.clear();
                              // location_controller.clear();
                              // flatHouseBuilding_controller.clear();
                              // contactno_controller.clear();
                              // inventory_controller.clear();
                              // inventoryCapacity_controller.clear();
                              // fse_controller.clear();
                              // date_controller.clear();
                              // medium_controller.clear();
                              // image= null;









                              Get.offAll(OnBoardingScreen());
                              Get.delete<OnBoardingController>();



                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  color: Colors.greenAccent),
                              height: widgetHeight * .05,
                              width: textWidth * .25,
                              child: Text("OK",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: textWidth*.04,
                                    fontWeight: FontWeight.w600
                                ),),
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
                  top: -widgetHeight * .04,
                  left: textWidth * .33,
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




  Future showProfilefun() async{
    isLoading1(true);
    update();

    print("userId"+user_id);



    var map = new Map<String, dynamic>();
    map['user_id'] = user_id;


    api.profileInfo(map).then((value)
    {



      rxRequestStatus.value=Status.COMPLETED;
      profileResponse.value=value;

      print( "show profile:"+profileResponse.value.message.toString());



      if(profileResponse!=null  ) {

        if(profileResponse.value.status==true) {
          fse_controller = TextEditingController(text: profileResponse.value?.name.toString()??"");


          // location_controller = TextEditingController(text:profileResponse.value.address.toString());
          // contactno_controller = TextEditingController(text: profileResponse.value.phone.toString());
          print("dkosdoksdkoskod");

          isLoading1(false);

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
        if(profileResponse.value.status==false) {


          print("xlscxsocxksxs");


          isLoading1(false);
          update();
          Get.snackbar(
            profileResponse.value.message.toString(),
            "",
            backgroundColor: const Color(0xFF33DF92),


            forwardAnimationCurve: Curves.easeOutBack,

            snackPosition: SnackPosition.BOTTOM,



          );


        }
      }

      else
      {



        isLoading1(false);

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







      isLoading1(false);

      update();


      print("d,ldldwdwdwdpwpd");

        Get.snackbar(
        error.toString(),
        "",
        backgroundColor: const Color(0xFF33DF92),
        forwardAnimationCurve: Curves.easeOutBack,
        snackPosition: SnackPosition.BOTTOM,


      );

      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    }

    );



  }



  String? get errorText {
    // at any time, we can get the text from _controller.value.text
    final text =onBoardingid_controller.text.toString();

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

  void _getSharedPreferences() async
  {




    user_id=  Preference.shared?.getString(Preference.User_id)??"";
    // showProfilefun();

    apiFetch();


    var date = DateTime.now();

     var dateformat=DateFormat("dd/MM/yyyy");


      currentDate=dateformat.format(date);
      date_controller = TextEditingController(text: currentDate);


    update();









  }




  Future<void> apiFetch() async {
    var status = true;

    isLoading(true);
    update();




    await Future.wait([ showProfilefun(),   determinePosition()]).then((v) {


      for (var item in v) {

        print('$item \n');


      }


    }).whenComplete(() {



      isLoading(false);

      update();

      print("whencompled");



      status = false;


    });

    print(status == true ? 'Loading' : 'FINISHED');
  }



  launchURLBrowser(String url) async {
    //const url = 'https://flutterdevs.com/';
    // var url = "http://mobec.io/privacy-policy";
    if(await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Cannot load Url $url";
    }
  }



}