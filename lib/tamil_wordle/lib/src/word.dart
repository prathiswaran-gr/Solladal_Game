library tamil_wordle;

import 'allowed_words.dart';

import 'database.dart';

class Word {
  late String _secretWord;
  late AllowedWords allowedWords;
  final Map<String, AllowedWords> _wordList = {};
  late List<String> _keyList;

  //Instantiating the range from the tamil unicode table.
  final int _akk = 'ஃ'.codeUnits[0];
  final int _ha = 'ஹ'.codeUnits[0];
  final int _aa = 'ா'.codeUnits[0];
  final int _dot = '்'.codeUnits[0];
  final int _round = 'ஂ'.codeUnits[0];

  //Getting the secreword
  String get secretWord {
    return _secretWord;
  }

  //Getting the wordlist
  Map<String, AllowedWords> get wordList {
    return _wordList;
  }

  //Getting the keylist
  List<String> get keyList {
    return _keyList;
  }

  //Creating a constructor with Database dependency
  Word(Database database) {
    _secretWord = database.secretWord;
    _keyList = database.keyList;
    
    for (List<dynamic> word in database.wordList) {
      Uri? audio, image, video;
      if (word[1] != null) {
        audio = Uri.parse(word[1]!);
      }
      if (word[2] != null) {
        image = Uri.parse(word[2]!);
      }
      if (word[3] != null) {
        video = Uri.parse(word[3]!);
      }
      allowedWords = AllowedWords(word[0]!, audio, image, video);
      _wordList[word[0]!] = allowedWords;
    }
  }

  //Splitting the secret word in the unicode value and storing in a list
  List<String> getLetters() {
    List<int> wordInt = _secretWord.runes.toList();

    List<String> letters = [];
    int previousLetter = 0;

    for (int letter in wordInt) {
      if (previousLetter == 0) {
        previousLetter = validateKaSequence(letter, _secretWord);
        continue; //skip the current iteration.
      }
      if ((letter >= _aa && letter <= _dot) || letter == _round) {
        letters.add(
            String.fromCharCode(previousLetter) + String.fromCharCode(letter));
        previousLetter =
            0; //adding join letter with the previous lettter (eg.) ('க' + 'ஂ' = 'க்')
      } else {
        letters.add(String.fromCharCode(
            previousLetter)); //Adding single letter (eg.) 'க'
        previousLetter = validateKaSequence(letter, _secretWord);
      }
    }
    if (previousLetter != 0) {
      letters.add(
          String.fromCharCode(previousLetter)); //Adding single letter (eg.) 'க'
    }
    return letters;
  }

  int validateKaSequence(int letter, String word) {
    //Validating the range of ஃ to	ஹ
    if (!(letter >= _akk && letter <= _ha)) {
      throw FormatException(
        'Invalid input.',
        'Invalid letter :' + String.fromCharCode(letter),
      );
    }
    return letter;
  }
}
