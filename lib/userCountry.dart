import 'dart:convert';
import 'SimpleLogToDb.dart' as SimpleLogger;
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';

class UserDetails{

void lookupUserCountry() async {

  final response = await http.get(Uri.parse("https://api.ipregistry.co?key=tryout"));

  if (response.statusCode == 200) {
    dynamic country_name = json.decode(response.body)['location']['country']['name'];
    print("The country is : $country_name");
    SimpleLogger.BasicLog.AddLog("The country of the user is : $country_name"+" "+DateTime.now().toUtc().toString());
  }
  else{
    SimpleLogger.BasicLog.AddLog("Try to catch the country name via wifi IPV4 address");
  }
}

void gettingIP() async{

      final NetworkInfo _networkInfo = NetworkInfo();

      dynamic wifiIPv4Addr = await _networkInfo.getWifiIP();

      //print("The wifiIPV4Addr : $wifiIPv4Addr");

      SimpleLogger.BasicLog.AddLog("User's Wifi IPV4 Address : $wifiIPv4Addr"+" "+DateTime.now().toUtc().toString());
  
  }
}