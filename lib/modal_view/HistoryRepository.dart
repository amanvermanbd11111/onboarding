
import 'package:onboarding/modal/HistoryResponse.dart';
import 'package:onboarding/utilts/Strings.dart';
import '../data/network/network_api_services.dart';

class HistoryRepository
{



  final  _apinetwork=NetworkApiServices();


  Future<HistoryResponse>historyInfo(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.Url+"mobec_onboarding/get_history.php");
    return HistoryResponse.fromJson(response);


  }
















}

