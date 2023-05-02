//3 Letter Words Database

// ignore_for_file: unnecessary_this

library tamil_wordle;

import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//Creating a class Database that returns Secretword , WordList, key List

class Database {
  late String _secretWord;
  late List<List<dynamic>> _wordList;
  late List<String> _keyList;

  //Getting the Correct word
  String get secretWord {
    return _secretWord;
  }

  //Getting the list of words
  List<List<dynamic?>> get wordList {
    return _wordList;
  }

  //Getting the list of keys
  List<String> get keyList {
    return _keyList;
  }

  //Constructor; - Non-Parameterized
  Database(Map<String, dynamic> data) {
    //Map<String, dynamic> data = data_get();
    _secretWord = data["sw"];
    _keyList = data["kl"];
    _wordList = data["wl"];
  }
}
