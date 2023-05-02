import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:solladal/config/colors.dart';
import 'package:solladal/flipcard.dart';
import 'firebase.dart' as fb;
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'logging_level.dart' as LoggingLevels;
import 'BasicLog.dart' as BasicLogs;
import 'package:intl/intl.dart';

import 'package:solladal/shared/appbar_widget.dart';
import 'package:tamil_wordle/tamil_wordle.dart' as lib;
import 'package:tamil_wordle/tamil_wordle.dart';
//import 'package:tamil_wordle/firebase_data_get.dart' as fdgetData;
import 'board.dart';
import 'firebase_options.dart';
import 'keyboard_single_file.dart';
import 'SimpleLogToDb.dart' as SimpleLogger;
import 'userCountry.dart' as UserDetails;

late Map<String, dynamic> data;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SimpleLogger.BasicLog.AddLog("Firebase ensure initialized successfully!" +
      " " +
      DateTime.now().toUtc().toString());
  BasicLogs.Log.basic_log("Firebase ensure initialized successfully!" +
      " " +
      DateTime.now().toUtc().toString());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  settingLoggingLevel();
  gettingLogFlagFormFirebase();
  UserDetails.UserDetails users = UserDetails.UserDetails();
  users.lookupUserCountry();
  users.gettingIP();
  data = await data_get();
  //data_get();
  runApp(Solladal());
}

void settingLoggingLevel() {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final SimpleLogRef =
      db.collection("LoggingLevel").doc('SimpleLogCode').set({'simple': true});

  final DebugLogRef =
      db.collection("LoggingLevel").doc("DebugLogCode").set({'debug': true});
}

void gettingLogFlagFormFirebase() {
  LoggingLevels.LoggingLevel obj = LoggingLevels.LoggingLevel();

  bool simple_log_code_value;
  bool debug_log_code_value;
  bool simple_log_firebase_value;
  bool debug_firebase_value;

  FirebaseFirestore dataBaseLog = FirebaseFirestore.instance;

  final SimpleLogCodeRef =
      dataBaseLog.collection("LoggingLevel").doc('SimpleLogCode');
  final DebugLogCodeRef =
      dataBaseLog.collection("LoggingLevel").doc('DebugLogCode');
  final SimpleLogFirebaseRef =
      dataBaseLog.collection("LoggingLevel").doc('SimpleLogFirebaseControl');
  final DebugLogFirebaseRef =
      dataBaseLog.collection("LoggingLevel").doc('DebugLogFirebaseControl');

  SimpleLogCodeRef.get().then((DocumentSnapshot doc) {
    dynamic SimpleLogCodeValue = doc.data();
    //print(SimpleLogCodeValue);
    simple_log_code_value = SimpleLogCodeValue['simple'];
    obj.simpleLog_from_code_control(simple_log_code_value);
  });

  DebugLogCodeRef.get().then((DocumentSnapshot doc_1) {
    dynamic DebugLogCodeValue = doc_1.data();
    //print(DebugLogCodeValue);
    debug_log_code_value = DebugLogCodeValue['debug'];
    obj.debugLog_from_code_control(debug_log_code_value);
  });

  SimpleLogFirebaseRef.get().then((DocumentSnapshot doc_2) {
    dynamic SimpleLogFirebaseValue = doc_2.data();
    //print(SimpleLogFirebaseValue);
    bool simple_log_firebase_value = SimpleLogFirebaseValue['simple'];
    obj.simpleLog_from_firebase_control(simple_log_firebase_value);
  });

  DebugLogFirebaseRef.get().then((DocumentSnapshot doc_3) {
    dynamic DebugFirebaseValue = doc_3.data();
    //print(DebugFirebaseValue);
    bool debug_log_firebase_value = DebugFirebaseValue['debug'];
    obj.debugLog_from_firebase_control(debug_log_firebase_value);
  });
}

Future<Map<String, dynamic>> data_get() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  dynamic today_data_set;

  DateTime today_date_time = DateTime.now();

  var formatter = DateFormat('yyyy-MM-dd');

  final String formatted = formatter.format(today_date_time);

  final dataRef =
      db.collection("three_letter_game_with_dateFlag").doc("${formatted}");

  if (today_data_set == null) {
    await dataRef.get().then((DocumentSnapshot doc) {
      today_data_set = doc.data();
    });
  }
  String secretWord = today_data_set["Secret_Word"];
  print(secretWord);

  List<String> keyList = today_data_set["Keyboard"].split(",");
  List<String> wordlistconvert = today_data_set["Word_List"].split(",");

  List<List<dynamic>> wordList = [];

  for (int i = 0; i < wordlistconvert.length; i++) {
    List<dynamic> temp = [wordlistconvert[i], null, null, null];
    wordList.add(temp);
  }

  Map<String, dynamic> firebaseData = {
    "sw": secretWord,
    "kl": keyList,
    "wl": wordList
  };
  return firebaseData;
}

dynamic unique_id_create() {
  var uuid = Uuid();

  var unique_id_players = uuid.v1();

  print(unique_id_players);

  SimpleLogger.BasicLog.AddLog(
      "Unique Id for the player is: $unique_id_players" +
          " " +
          DateTime.now().toUtc().toString());
  BasicLogs.Log.basic_log("Unique Id for the player is: $unique_id_players" +
      " " +
      DateTime.now().toUtc().toString());
  return unique_id_players;
}

class Solladal extends StatefulWidget {
  const Solladal({Key? key}) : super(key: key);

  @override
  State<Solladal> createState() => _SolladalState();
}

class _SolladalState extends State<Solladal> {
  FirebaseFirestore dataBaseInstance = FirebaseFirestore.instance;

  final List<List<GlobalKey<_SolladalState>>> _flipTilesState = [];
  final int rows = 6;
  int numberOfTiles = 18;

  late List<List<FlipCardController>> flipCardControllerList;

  final int columns = 3;

  late lib.Database database;
  late lib.Word word;
  late lib.Keyboard keyboard;
  late lib.Game game;

  _SolladalState() {
    database = lib.Database(data);

    word = lib.Word(database);
    keyboard = lib.Keyboard(word.keyList);
    flipCardControllerList = [];

    game = lib.Game(rows, columns, keyboard, word);

    for (int i = 0; i < rows; i++) {
      List<FlipCardController> flipCardControllerRowist = [];
      for (int j = 0; j < columns; j++) {
        flipCardControllerRowist.add(FlipCardController());
      }
      flipCardControllerList.add(flipCardControllerRowist);
    }
  }

  void _buttonKeyPressed(String letter) {
    setState(() {
      SimpleLogger.BasicLog.AddLog("The button $letter is pressed on keybaord" +
          " " +
          DateTime.now().toUtc().toString());

      game.addLetter(letter);
      SimpleLogger.BasicLog.AddLog(
          "Pressing $letter successfully added to tile" +
              " " +
              DateTime.now().toUtc().toString());
    });
    print("The letter is $letter");

    print(game.currentWord);
    String current_word = game.currentWord.toString();
    SimpleLogger.BasicLog.AddLog(
        "The current set of letters user typed in the form of list is below: $current_word " +
            " " +
            DateTime.now().toUtc().toString());
    BasicLogs.Log.basic_log(
        "The current set of letters user typed in the form of list is below: $current_word " +
            " " +
            DateTime.now().toUtc().toString());
  }

  void _clearButtonPressed() {
    setState(() {
      SimpleLogger.BasicLog.AddLog("User pressed the clear button!" +
          " " +
          DateTime.now().toUtc().toString());

      game.removeLetter();

      SimpleLogger.BasicLog.AddLog(
          "The letter was removed! " + " " + DateTime.now().toUtc().toString());
    });

    print(game.currentWord);

    String game_current_word = game.currentWord.toString();

    SimpleLogger.BasicLog.AddLog(
        "After removing the letter the current word in tile given below! $game_current_word " +
            " " +
            DateTime.now().toUtc().toString());
    BasicLogs.Log.basic_log(
        " User press remove letter! After removing the letter the current word in tile given below! $game_current_word " +
            " " +
            DateTime.now().toUtc().toString());
    //SimpleLogger.BasicLog.AddLog(game.currentWord);
  }

  void _enterButtonPressed() {
    setState(() {
      SimpleLogger.BasicLog.AddLog(
          "User pressing the Enter button to check the word " +
              " " +
              DateTime.now().toUtc().toString());
      game.wordCheck();

      if (game.wordStatus == WordStatus.notInWordList) {
        SimpleLogger.BasicLog.AddLog(
            "The user guessed word is not in word-list" +
                " " +
                DateTime.now().toUtc().toString());
        BasicLogs.Log.basic_log("The user guessed word is not in word-list" +
            " " +
            DateTime.now().toUtc().toString());
      } else {
        SimpleLogger.BasicLog.AddLog(
            "The user guessed word is in the word-list" +
                " " +
                DateTime.now().toUtc().toString());

        int flipRow = game.activeRow - 1;

        if (game.gameStatus != Status.inProgress) {
          flipRow++;
          SimpleLogger.BasicLog.AddLog(
              "Game over!" + " " + DateTime.now().toUtc().toString());
          BasicLogs.Log.basic_log(
              "Game over!" + " " + DateTime.now().toUtc().toString());
          SimpleLogger.BasicLog.saveLog();
          //print(SimpleLogger.BasicLog.logs);
        }
        Future.delayed(Duration(seconds: 1), () {
          flipCardControllerList[flipRow][0].toggleCard();
          Future.delayed(Duration(seconds: 1), () {
            flipCardControllerList[flipRow][1].toggleCard();
            Future.delayed(Duration(seconds: 1), () {
              flipCardControllerList[flipRow][2].toggleCard();
            });
          });
        });
      }

      print("The word status is: ");
      print(game.wordStatus);
      String game_wordStatus = game.wordStatus.toString();
      SimpleLogger.BasicLog.AddLog(
          "The status of a word is given below $game_wordStatus " +
              " " +
              DateTime.now().toUtc().toString());
      BasicLogs.Log.basic_log(
          "The status of a word is given below $game_wordStatus " +
              " " +
              DateTime.now().toUtc().toString());
      //SimpleLogger.BasicLog.AddLog(game.wordStatus);
      String game_gameStatus = game.gameStatus.toString();
      SimpleLogger.BasicLog.AddLog(
          "The status of a game is given below $game_gameStatus " +
              " " +
              DateTime.now().toUtc().toString());
      BasicLogs.Log.basic_log(
          "The status of a game is given below $game_gameStatus " +
              " " +
              DateTime.now().toUtc().toString());
      //SimpleLogger.BasicLog.AddLog(game.gameStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.data);
    SimpleLogger.BasicLog.AddLog("Build method run successfully" +
        " " +
        DateTime.now().toUtc().toString());

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primarySwatchMaterialColorWhite,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Stylish'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AppBarWidget(
        boardWidget:
            Board(game: game, flipCardControllerList: flipCardControllerList),
        keyBoardwidget: Keyboard1(
            keyboard,
            game,
            game.canAddLetter,
            game.canRemoveLetter,
            _buttonKeyPressed,
            _clearButtonPressed,
            _enterButtonPressed),
      ),
    );
  }
}