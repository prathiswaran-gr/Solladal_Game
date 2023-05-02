import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirebaseData{

  late String keyboard;
  late List<String> word_list;
  late DateTime date;
  late String secret_word;

  //late Map<String,dynamic> today_data_set = getData();
  
  // dynamic data(){
  //   print("Data is $today_data_set");
  //    }

  void getData() async {

  FirebaseFirestore db = FirebaseFirestore.instance;

  DateTime today_date_time = DateTime.now();

  var formatter = DateFormat('yyyy-MM-dd');

  final String formatted = formatter.format(today_date_time);

  print(formatted); 

  // final dataRef = db.collection("three_letter_game_with_dateFlag").doc("${formatted}");

  // await dataRef.get().then((DocumentSnapshot doc) {

  //   dynamic  today_data_set = doc.data();

  //   print("Today data set is ${today_data_set}");

  db.collection('City').doc('Tokyo').set({'capital':'Japan'});    
    //return today_data_set;

  }
}



