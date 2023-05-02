import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart' as mainFile;
import 'firebase.dart' as fd;
import 'separateLogs.dart' as Sl;
import 'logging_level.dart' as Logging_level;
import 'BasicLog.dart' as BasicLogFile;

class BasicLog{

  // Logging_level.LoggingLevel log_level = Logging_level.LoggingLevel();
  static bool simple_log_code = Logging_level.LoggingLevel.simple_log_from_code_control;
  static bool simple_log_firebase = Logging_level.LoggingLevel.simple_log_from_firebase_control;
  static bool debug_log_code = Logging_level.LoggingLevel.debug_log_from_code_control;
  static bool debug_log_firebase = Logging_level.LoggingLevel.debug_log_from_firebase_control;
  static int count = 1;
  static Map<String,dynamic> logs = {};
  //dynamic every_state_change_logger;

  
  static AddLog(dynamic log){

        //every_state_change_logger = logger;

        //count += 1; 
        if(count < 10){
          logs['000'+(count++).toString()] = log;
        }
        else{
        logs[(count++).toString()] = log;
        }
         // bunch_of_logger['$DateTime.now()'] = 'Testing'; 
        //bunch_logger_list.add(bunch_of_logger);
        
        //print(logs);        

        // FirebaseFirestore db = FirebaseFirestore.instance;
        
        // db.collection('EveryStateLog').doc('${mainFile.unique_id_create()}').update(bunch_of_logger);

        //db.collection('City').doc('London').set({"country":"UK"});
  }

  static saveLog(){

    FirebaseFirestore dataBase = FirebaseFirestore.instance;

    // logs.forEach((key, value) {
      
    //   int parsing_key = int.parse(key);
    //   if( parsing_key <= 15 ){
    //   dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').set({'$key':'$value'});
    //   }
    //   else if( parsing_key <= 25){
    //   dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').set({'$key':'$value'});
    //   }
    //   // else if(int.parse(key) <= 35){
    //   // dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').collection('More-Logs').doc('Next-10').set({'$key':'$value'});
    //   // }
    //   // else if(int.parse(key) <= 45){
      
    //   // dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').collection('More-Logs').doc('Next-10').collection('More--Logs').doc('Next--10').set({'$key':'$value'});
    //   // }
    //   // else if(int.parse(key) <= 55){      
    //   // dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').collection('More-Logs').doc('Next-10').collection('More--Logs').doc('Next--10').collection('More_Logs').doc('Next_10').set({'$key':'$value'});
    //   // }
    //   // else if(int.parse(key) <= 65){      
    //   // dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').collection('More-Logs').doc('Next-10').collection('More--Logs').doc('Next--10').collection('More_Logs').doc('Next_10').collection('More_logs').doc('Next---10').set({'$key':'$value'});
    //   // }
    //   else {      
    //   dataBase.collection("EveryStateLog").doc('${mainFile.unique_id_create()}').collection('MoreLogs').doc('Next10').collection('More-Logs').doc('Next-10').collection('More--Logs').doc('Next--10').collection('More_Logs').doc('Next_10').collection('More_logs').doc('Next---10').collection('Final-Log').doc("End-Log").set({'$key':'$value'});
    //   }
    // });

    if(debug_log_code == true || debug_log_firebase == true){
      
      Sl.SeparateLog();
      // print(Sl.SeparateLog.first_15_logs);
      // print(Sl.SeparateLog.second_15_logs);
      // print(Sl.SeparateLog.third_15_logs);
      // print(Sl.SeparateLog.fourth_15_logs);
      // print(Sl.SeparateLog.fifth_15_logs);
      // print(Sl.SeparateLog.sixth_15_logs);

      Map<String,dynamic> first_15_logs = Sl.SeparateLog.first_15_logs;
      bool first_log_flag = Sl.SeparateLog.first_log_flag;
      Map<String,dynamic> second_10_logs = Sl.SeparateLog.second_10_logs;
      //print(second_15_logs);
      bool second_log_flag = Sl.SeparateLog.seconed_log_flag;
      Map<String,dynamic> third_10_logs = Sl.SeparateLog.third_10_logs;
      bool third_log_flag = Sl.SeparateLog.third_log_flag;
      Map<String,dynamic> fourth_10_logs = Sl.SeparateLog.fourth_10_logs;
      bool fourth_log_flag = Sl.SeparateLog.fourth_log_flag;
      Map<String,dynamic> fifth_10_logs = Sl.SeparateLog.fifth_10_logs;
      bool fifth_log_flag = Sl.SeparateLog.fifth_log_flag;
      Map<String,dynamic> sixth_10_logs = Sl.SeparateLog.sixth_10_logs;
      bool sixth_log_flag = Sl.SeparateLog.sixth_log_flag;
      Map<String,dynamic> seventh_10_logs = Sl.SeparateLog.seventh_10_logs;
      bool seventh_log_flag = Sl.SeparateLog.seventh_log_flag;
      Map<String,dynamic> eigth_10_logs = Sl.SeparateLog.eight_10_logs;
      bool eight_log_flag = Sl.SeparateLog.eigth_log_flag;
      Map<String,dynamic> nineth_10_logs = Sl.SeparateLog.nineth_10_logs;
      bool nineth_log_flag = Sl.SeparateLog.nineth_log_flag;
      Map<String,dynamic> tenth_10_logs = Sl.SeparateLog.tenth_10_logs;
      bool tenth_log_flag = Sl.SeparateLog.tenth_log_flag;
      Map<String,dynamic> more_logs = Sl.SeparateLog.more_logs;
      bool more_log_flag = Sl.SeparateLog.more_log_flag;

      //print("The first 15 logs are $first_15_logs");
      // dataBase.collection("EveryStateLog").doc("User-1").set(logs);
      // dataBase.collection('DummyChecking').doc("HEllo").set({'1':"Hi chellam"});
      
      if(first_log_flag == true){
      dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('15-logs').set(first_15_logs);
      }
      if(second_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('16-25--logs').set(second_10_logs);      
      }
      if(third_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('26-35--logs').set(third_10_logs);     
      }
      if(fourth_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('36-45--logs').set(fourth_10_logs);   
      }
      if(fifth_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('46-55--logs').set(fifth_10_logs); 
      }
      if(sixth_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('56-65--logs').set(sixth_10_logs);
      }
      if(seventh_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('66-75--logs').set(seventh_10_logs);
      }
      if(eight_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('76-85--logs').set(eigth_10_logs);
      }
      if(nineth_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('86-95--logs').set(nineth_10_logs);
      }
      if(tenth_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('96-105--logs').set(tenth_10_logs);
      }
      if(more_log_flag == true){
         dataBase.collection('EveryStateLog').doc('ganesheswar@gmail.com').collection("DebugLog").doc('more-logs').set(more_logs);
      }
    }

    if(simple_log_code == true || simple_log_firebase == true){
      Map<String,dynamic> basic_log_statement = BasicLogFile.Log.basicLogs;
      dataBase.collection("EveryStateLog").doc("ganesheswar@gmail.com").collection('SimpleLog').doc('Log').set(basic_log_statement);
    }
  }
}
