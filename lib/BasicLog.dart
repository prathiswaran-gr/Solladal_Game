import 'main.dart' as MainFile;

class Log{

  static int count = 1;
  static Map<String,dynamic> basicLogs = {};

  static void basic_log(String logs){

      if(count < 10){
          basicLogs['000'+(count++).toString()] = logs;
        }
        else{
          basicLogs[(count++).toString()] = logs;
        }
  } 
}