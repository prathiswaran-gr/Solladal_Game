import 'SimpleLogToDb.dart' as SimpleLogs;

class SeparateLog{

  static  Map<String,dynamic> first_15_logs = {};
  static bool first_log_flag = false;
  static  Map<String,dynamic> second_10_logs= {};
  static bool seconed_log_flag = false;
  static  Map<String,dynamic> third_10_logs = {};
  static bool third_log_flag = false;
  static  Map<String,dynamic> fourth_10_logs= {};
  static bool fourth_log_flag = false;
  static  Map<String,dynamic> fifth_10_logs = {};
  static bool fifth_log_flag = false;
  static  Map<String,dynamic> sixth_10_logs = {};
  static bool sixth_log_flag = false;
  static  Map<String,dynamic> seventh_10_logs = {};
  static bool seventh_log_flag = false;
  static  Map<String,dynamic> eight_10_logs = {};
  static bool eigth_log_flag = false;
  static Map<String,dynamic> nineth_10_logs = {};
  static bool nineth_log_flag = false;
  static Map<String,dynamic> tenth_10_logs = {};
  static bool tenth_log_flag = false;
  static Map<String,dynamic> more_logs = {};
  static bool more_log_flag = false;

SeparateLog(){

  Map<String,dynamic> logs = SimpleLogs.BasicLog.logs;

  //print("The logs are $logs");

  logs.forEach((key, value) {

    int parsing_key = int.parse(key);

    if(parsing_key <= 15){
      first_log_flag = true;
      first_15_logs[key] = value;
    }
    else if(parsing_key <= 25){
      seconed_log_flag = true;
      second_10_logs[key] = value;
    }
    else if(parsing_key <= 35){
      third_log_flag = true;
      third_10_logs[key] = value;
    }
    else if(parsing_key <= 45){
      fourth_log_flag = true;
      fourth_10_logs[key] = value;
    }
    else if(parsing_key <= 55){
      fifth_log_flag = true;
      fifth_10_logs[key] = value;
    }
    else if(parsing_key <= 65){
      sixth_log_flag = true;
      sixth_10_logs[key] = value;
    }
    else if(parsing_key <= 75){
      seventh_log_flag = true;
      seventh_10_logs[key] = value;
    }
    else if(parsing_key <= 85){
      eigth_log_flag = true;
      eight_10_logs[key] = value;
    }
    else if(parsing_key <= 95){
      nineth_log_flag = true;
      nineth_10_logs[key] = value;
    }
    else if(parsing_key < 105){
      tenth_log_flag = true;
      tenth_10_logs[key] = value;
    }
    else{
      more_log_flag = true;
      more_logs[key] = value;
    }

  });
}

}