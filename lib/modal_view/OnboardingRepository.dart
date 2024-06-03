

import 'package:onboarding/modal/ProfileResponse.dart';
import 'package:onboarding/utilts/Strings.dart';


import '../data/network/network_api_services.dart';

class OnboardingRepository
{



  final  _apinetwork=NetworkApiServices();


  Future<ProfileResponse>profileInfo(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.Url+"mobec_onboarding/profile.php");
    return ProfileResponse.fromJson(response);


  }
















}


