
import 'package:onboarding/data/network/network_api_services.dart';
import 'package:onboarding/modal/ContactUsResponse.dart';
import 'package:onboarding/utilts/Strings.dart';




class ContactUSRepository
{
  final  _apinetwork=NetworkApiServices();

  Future<ContactUsResponse>sendFeedback(Map<String, dynamic> map) async
  {
    dynamic response =await  _apinetwork.postApiJsonEncode( map , Strings.packageUrl+"contact_us");
    return ContactUsResponse.fromJson(response);
  }
}