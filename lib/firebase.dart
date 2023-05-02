// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase{
  
  Firebase() {

    FirebaseFirestore db = FirebaseFirestore.instance;

//     final dataRef = db.collection('cities').doc('BJ');

//   dataRef.get().then(
//   (DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     print(data);
//   },
//   onError: (e) => print("Error getting document: $e"),
// );
final dataRef = db.collection('cities').doc('BJ');

dataRef.update({'population':'7777777779999997'});

  }  
}
// class City {

//   final String? name;
//   final String? state;
//   final String? country;
//   final bool? capital;
//   final int? population;
//   final List<String>? regions;

//   City({
//     this.name,
//     this.state,
//     this.country,
//     this.capital,
//     this.population,
//     this.regions
//   });

//   factory City.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot, SnapshotOptions? options,){
//     final data = snapshot.data();
//     return City(
//       name: data? ['name'],
//       state: data? ['state'],
//       country: data? ['country'],
//       capital: data? ['capital'],
//       population: data?['population'],
//       regions: data?['regions'] is Iterable ? List.from(data?['regions']) : null,
//     );
//   }

//   Map<String,dynamic> toFirestore(){
//     return {
//       if (name != null) "name":name,
//       if (state != null) "state":state,
//       if(country != null) "country" : country,
//       if(capital != null) "capital" : capital,
//       if (population != null) "population" : population,
//       if (regions != null) "regions" : regions,
//     };
//   }

// }

//   final city = City(name:"Los Angeles",
//   state: "CA",
//   country: "USA",
//   capital: false,
//   population: 5000000,
//   regions: ["west_coast","socal"]);

//   FirebaseFirestore db = FirebaseFirestore.instance;

//   // final docRef = db.collection('City').doc("CityIDs");

  
//  void addData() async{

//   // db.collection("cities").doc("DC").update({
//   //   "regions": FieldValue.arrayUnion(["hello"])
//   // });

//   // db.collection("cities").doc("DC").update({
//   //   "regions": FieldValue.arrayRemove(["east_coast"])
//   // });

//   db.collection("cities").doc("DC").update({
//     "population": FieldValue.increment(600)
//   });

//   // db.collection("users").doc("frank").set({
//   //   "name":"Frank",
//   //   "favourites":{
//   //     "food":"pizza",
//   //     "color":"Blue",
//   //     "subject":"maths"
//   //   },
//   //   "age":12
//   // }).then((value) {
//   //   print("Frank created");
//   // });

//   // db.collection("users").doc("frank").update({
//   //   "favourites":{
//   //     "food":"Idly",
//   //   },
//   // }).then((value) => print("Frank updated"));
   
//   //  final WashingDonRef = db.collection("cities").doc("DC");

//   //  WashingDonRef.update({"capital":true}).then((value) => print("Snapshot successfully updated!"),
//   //  onError: (e) => print("The error is ${e}"));

//   // final WashingDonRef = db.collection("cities").doc("BJ");

//   // final updates = <String,dynamic>{
//   //   "timeStamp": Timestamp.now(),
//   // };

//   // WashingDonRef.update(updates).then((value) => print("snaptube successfully updated"));

//   // final WashingDonRef = db.collection("cities").doc("Covai");

//   // WashingDonRef.set({
//   //   "name": "Covai",
//   //   "fav":{
//   //     "s1":1,
//   //     "s2":2
//   //   }
//   // });

//   // WashingDonRef.update({"name":"covai","fav.s2":30});

// //   var city = {"name":"Chennai","captial":true};
// // await docRef.set(city);
//   // var data = {"name":"Karur","capital":false};
//   // db.collection('City').add(data).then((value) => print("The data id is ${value.id}"));

//     // var dataTypes = {
//     //   "String":"Ganesh",
//     //   "boolean":true,
//     //   "number":3.1415,
//     //   "date":Timestamp.now(),
//     //   "list":[1,2,3],
//     //   "null":null
//     // };

//     // var nestedData = {
//     //   'a':3,
//     //   'b':5
//     // };

//     // dataTypes["object"] = nestedData;

//     // db.collection("cities").doc("one").set(dataTypes, SetOptions(merge: true)).onError((error, stackTrace) => print("The error is ${error}"));

//     // var data = {"literacy_rate" : "87.98%"};
//     // db.collection('cities').doc('Delhi').set(data, SetOptions(merge: true));

//     // FirebaseFirestore db = FirebaseFirestore.instance;

//     // var employeesRef = db.collection("Employees");

//     // var employee_list = [
//     //   {"name":"Ganesh",
//     //   "age":21,
//     //   "Nationality":"Indian"},
//     //   {"name":"Mani",
//     //   "age":24,
//     //   "Nationality":"Indian"},
//     //   {"name":"Aarthi",
//     //   "age":22,
//     //   "Nationality":"Indian"},
//     // ];

//     // // for (var emplyee_list in employee_list){
//     // //   employeesRef.doc("${emplyee_list["name"]}").set(emplyee_list).onError((error, stackTrace) => print(error) );
//     // // }

//     // // FirebaseFirestore db = FirebaseFirestore.instance;

//     // // var citiesRef = db.collection('cities');

//     // // citiesRef.doc("TamilNadu").collection("Chennai").doc("Tambaram").set({
//     // //   "area": "87.64 km^2",
//     // //   "population" : "960,887"
//     // // });

//     // citiesRef.doc("TamilNadu").collection("Chennai").doc("Chrompet").set({
//     //   "area":"121.89 km^2",
//     //   "population":"987,678"
//     // });

//     // citiesRef.doc("TamilNadu/Chennai/Mambalam").set({
//     //   "area":"123.44 km^2",
//     //   "population":"456.897"
//     // });

//     // var stateQuery = citiesRef.where("state","==","San Francisco");
//     // final stateQuery = citiesRef.where("state");

//     // print(" The state query is : ${stateQuery.get()} " );

// //     citiesRef.doc('SF').set({
// //     "name": "San Francisco", "state": "CA", "country": "USA",
// //     "capital": false, "population": 860000,
// //     "regions": ["west_coast", "norcal"]
// //     });
// //     citiesRef.doc("LA").set({
// //     "name": "Los Angeles", "state": "CA", "country": "USA",
// //     "capital": false, "population": 3900000,
// //     "regions": ["west_coast", "socal"] });
// // citiesRef.doc("DC").set({
// //     "name": "Washington, D.C.", "state": null, "country": "USA",
// //     "capital": true, "population": 680000,
// //     "regions": ["east_coast"] });
// // citiesRef.doc("TOK").set({
// //     "name": "Tokyo", "state": null, "country": "Japan",
// //     "capital": true, "population": 9000000,
// //     "regions": ["kanto", "honshu"] });
// // citiesRef.doc("BJ").set({
// //     "name": "Beijing", "state": null, "country": "China",
// //     "capital": true, "population": 21500000,
// //     "regions": ["jingjinji", "hebei"] });
//     // FirebaseFirestore db = FirebaseFirestore.instance;
//     // print("hello1");
//     // final msg = db.collection('users').doc('ganesh').collection('hobbies').doc('dailyhobbies');
//     // print("hello");
//   //This data is added to firebaseFirestore
//   // final user = <String,dynamic>{
//   //   "first":"Ganesh",
//   //   "middle":"-",
//   //   "last":"Eswar",
//   //   "born": 22
//   // };

//     // db.collection('users').add(user).then((DocumentReference doc) => 
//     // print('DocumentSnapshot added with ID: ${doc.id}'));
//   }

//   // static void getData(){

//   //   FirebaseFirestore db = FirebaseFirestore.instance;

//   //   db.collection('users').get().then((event){
//   //     for(var doc in event.docs){
//   //       print("${doc.id} => ${doc.data()}");
//   //     }
//   //   });

//     // FirebaseFirestore dbRef = FirebaseFirestore.instance;

//     // final userData = dbRef.collection('users').doc('OSwoJXZpWZGFSOyRdk7k');

//     // print(userData);
//   // }

