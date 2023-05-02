import 'package:cloud_firestore/cloud_firestore.dart';

class LogToDb {
  static bool isDebugModeEnabled = false;
  static Future<bool> isDebugModeOn() async {
    CollectionReference colRefDebug =
        FirebaseFirestore.instance.collection('isDebug');
    await colRefDebug.doc('debug').get().then(
        (value) => isDebugModeEnabled = (value.data() as dynamic)['isDebug']);
    return isDebugModeEnabled;
  }

  static Future<void> debug(String msg, String guid) async {
    CollectionReference colRefLogging =
        FirebaseFirestore.instance.collection('debugLog');
    String dateTime = DateTime.now().toString();

    if (await isDebugModeOn()) {
      print(isDebugModeEnabled);
      await colRefLogging
          .doc(dateTime.substring(0, 10))
          .set({'date': dateTime.substring(0, 10)});
      await colRefLogging
          .doc(dateTime.substring(0, 10))
          .collection(guid)
          .doc(dateTime)
          .set({'msg': msg, 'timestamp': dateTime});
    }
  }

  static Future<void> info(String msg, String guid) async {
    CollectionReference colRefLogging =
        FirebaseFirestore.instance.collection('infolog');
    String dateTime = DateTime.now().toString();
    await colRefLogging
        .doc(dateTime.substring(0, 10))
        .set({'date': dateTime.substring(0, 10)});
    await colRefLogging
        .doc(dateTime.substring(0, 10))
        .collection(guid)
        .doc(dateTime)
        .set({'msg': msg, 'timestamp': dateTime});
  }
}
