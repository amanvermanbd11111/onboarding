

import 'package:onboarding/modal/LoginResponse.dart';
import 'package:onboarding/utilts/Strings.dart';


import '../data/network/network_api_services.dart';

class LoginRepository
{



  final  _apinetwork=NetworkApiServices();


  Future<LoginResponse>User_Login_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.Url+"mobec_onboarding/login.php");
    return LoginResponse.fromJson(response);


  }
















}


