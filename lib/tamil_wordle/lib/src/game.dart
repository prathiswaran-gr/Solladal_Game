library tamil_wordle;

import 'package:tamil_wordle/src/database.dart';
import 'package:tamil_wordle/src/keyboardkey_fg_color.dart';
import 'package:tamil_wordle/src/tile_fg_color.dart';

import 'helper.dart';
import 'tile_border_color.dart';
import 'word_status.dart';

import 'tile_bg_color.dart';
import 'keyboardkey_bg_color.dart';
import 'keyboard.dart';
import 'word.dart';
import 'tile.dart';
import 'status.dart';

//Game Class is the Main Class
class Game {
  int activeRow = 0;
  int activeCol = 0;
  final int _rows;
  final int _columns;
  late List<List<Tile>> _board;
  late List<String> _currentWord;
  late List<String> _existingWord;
  late final Keyboard _keyboard;
  late final Word _word;
  late Status gameStatus;
  late WordStatus wordStatus;

  late List<String> _allowedWords;

  //Getting the board
  List<List<Tile>> get board {
    return _board;
  }

  //Getting the currentWord
  List<String> get currentWord {
    return _currentWord;
  }

  //Getting keyboard listener
  Keyboard get keyboard {
    return _keyboard;
  }

  //Validating  the size of  Column and Row
  bool get canAddLetter {
    return activeRow < _rows && activeCol < _columns;
  }

  bool get canRemoveLetter {
    return activeCol > 0;
  }

  //Constructor
  Game(this._rows, this._columns, this._keyboard, this._word) {
    //Creating a grid view layout with default tile color black.
    _board = List.generate(
        _rows,
        (_) => List.generate(
            _columns,
            (_) =>
                Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white))));
    _currentWord = [];
    _existingWord = [];
    _allowedWords = _word.wordList.keys.toList();
    _board[0][0].bgColor = Helper.getTileBGColor(TileBGColor.lightGrey);
    gameStatus = Status.inProgress;
  }

  void addLetter(String letter) {
    //Adding the current letter in the tile with a specific column.
    if (canAddLetter) {
      _currentWord.add(letter);
      (_board[activeRow][activeCol]).letter = letter;
      (_board[activeRow][activeCol]).borderColor =
          Helper.getTileBorderColor(TileBorderColor.lightGrey);
      (_board[activeRow][activeCol]).bgColor =
          Helper.getTileBGColor(TileBGColor.white);

      activeCol++;
      if (activeCol < _columns) {
        (_board[activeRow][activeCol]).bgColor =
            Helper.getTileBGColor(TileBGColor.lightGrey);
      }
    }
    //if (!canAddLetter) {
    else {
      disableKeyboard();
    }
  }

  void removeLetter() {
    //Deleting the current letter in the tile with a specific column.
    _currentWord.removeLast();
    if (activeCol < _columns) {
      (_board[activeRow][activeCol]).bgColor =
          Helper.getTileBGColor(TileBGColor.white);
    }
    activeCol--;
    (_board[activeRow][activeCol]).letter = '';
    (_board[activeRow][activeCol]).bgColor =
        Helper.getTileBGColor(TileBGColor.lightGrey);
    (_board[activeRow][activeCol]).borderColor =
        Helper.getTileBorderColor(TileBorderColor.lightGrey);
    if (canAddLetter) {
      enableKeyboard();
    }
  }

  //validating the current word and changing the color of tiles and keys
  WordStatus wordCheck() {
    if (!(_allowedWords.contains(_currentWord.join()))) {
      wordStatus = WordStatus.notInWordList;
      print(wordStatus);
      return wordStatus;
    } else if (_existingWord.contains(_currentWord.join())) {
      wordStatus = WordStatus.alreadyExist;
      print(wordStatus);
      return wordStatus;
    }

    List<String> secretWord = _word.getLetters();

    for (int currentPosition = 0;
        currentPosition < _currentWord.length;
        currentPosition++) {
      if (_currentWord[currentPosition] == secretWord[currentPosition]) {
        (_board[activeRow][currentPosition]).flippedBGColor =
            Helper.getTileBGColor(TileBGColor.green);
        (_board[activeRow][currentPosition]).flippedLetterColor =
            Helper.getTileFGColor(TileFGColor.white);
        (_board[activeRow][currentPosition]).borderColor =
            Helper.getTileBorderColor(TileBorderColor.green);

        secretWord[currentPosition] = Helper.existingString;

      
          _keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor =
              Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green);
          _keyboard.keyboardMap[_currentWord[currentPosition]]!.letterColor =
              Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white);
      
      }
    }

    for (int currentPosition = 0;
        currentPosition < _currentWord.length;
        currentPosition++) {
      if (secretWord[currentPosition] != Helper.existingString) {
        if (secretWord.contains(_currentWord[currentPosition])) {
          (_board[activeRow][currentPosition]).flippedBGColor =
              Helper.getTileBGColor(TileBGColor.yellow);
          (_board[activeRow][currentPosition]).flippedLetterColor =
              Helper.getTileFGColor(TileFGColor.white);
          (_board[activeRow][currentPosition]).borderColor =
              Helper.getTileBorderColor(TileBorderColor.yellow);
          for (int i = 0; i < secretWord.length; i++) {
            if (secretWord[i] == currentWord[currentPosition]) {
              secretWord[i] = Helper.existingString;
              break;
            }
          }
          if (_keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor !=
              Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green)) {
            _keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor =
                Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow);
          }
          _keyboard.keyboardMap[_currentWord[currentPosition]]!.letterColor =
              Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white);
        }
        // else {
        //   (_board[activeRow][currentPosition]).flippedBGColor =
        //       Helper.getTileBGColor(TileBGColor.darkGrey);
        //   (_board[activeRow][currentPosition]).flippedLetterColor =
        //       Helper.getTileFGColor(TileFGColor.white);
        //   (_board[activeRow][currentPosition]).borderColor =
        //       Helper.getTileBorderColor(TileBorderColor.darkGrey);
        //   _keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor =
        //       Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey);
        //   _keyboard.keyboardMap[_currentWord[currentPosition]]!.letterColor =
        //       Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white);
        // }
      }
    }

    for (int currentPosition = 0;
        currentPosition < _currentWord.length;
        currentPosition++) {
      if (_currentWord[currentPosition] != secretWord[currentPosition]) {
        if ((_board[activeRow][currentPosition]).flippedBGColor !=
                Helper.getTileBGColor(TileBGColor.yellow) &&
            (_board[activeRow][currentPosition]).flippedBGColor !=
                Helper.getTileBGColor(TileBGColor.green)) {
          (_board[activeRow][currentPosition]).flippedBGColor =
              Helper.getTileBGColor(TileBGColor.darkGrey);
          (_board[activeRow][currentPosition]).flippedLetterColor =
              Helper.getTileFGColor(TileFGColor.white);
          (_board[activeRow][currentPosition]).borderColor =
              Helper.getTileBorderColor(TileBorderColor.darkGrey);

          if (_keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor !=
                  Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green) &&
              _keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor !=
                  Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow)) {
            _keyboard.keyboardMap[_currentWord[currentPosition]]!.bgColor =
                Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey);
            _keyboard.keyboardMap[_currentWord[currentPosition]]!.letterColor =
                Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white);
          }
        }
      }
    }

    if (_currentWord.join() == _word.secretWord) {
      //checking the current word and secrete word then, displaying the label
      print('Answer is correct!');
      gameStatus = Status.win;
    } else if (activeRow + 1 == _rows) {
      gameStatus = Status.lose;
    } else {
      activeRow++;
      activeCol = 0;
      (_board[activeRow][activeCol]).bgColor =
          Helper.getTileBGColor(TileBGColor.lightGrey);
      enableKeyboard();
    }

    wordStatus = WordStatus.success;
    print(gameStatus);
    print(wordStatus);
    _existingWord.add(_currentWord.join());
    _currentWord.clear();
    return wordStatus;
  }

  void disableKeyboard() {
    _keyboard.isEnabled = false;

    for (var entry in _keyboard.keyboardMap.entries) {
      if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightDarkGrey);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGrey);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightYellow);
      } else /*if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green)) */
      {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGreen);
      }
      // else if (entry.value.bgColor ==
      //     Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGreen)) {
      //   entry.value.bgColor =
      //       Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green);
      // }
      // else if (entry.value.bgColor ==
      //     Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightYellow)) {
      //   entry.value.bgColor =
      //       Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow);
      // }
      // else if (entry.value.bgColor ==
      //     Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGrey)) {
      //   entry.value.bgColor =
      //       Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      // }
      // else {
      //   entry.value.bgColor =
      //       Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey);
      // }
    }
  }

  void enableKeyboard() {
    _keyboard.isEnabled = true;

    for (var entry in _keyboard.keyboardMap.entries) {
      if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGreen)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightYellow)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow);
      } else if (entry.value.bgColor ==
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGrey)) {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      } else {
        entry.value.bgColor =
            Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey);
      }
    }
  }
}

// void main() {
//   Word word = Word(Database());
//   Keyboard keyboard = Keyboard(word.keyList);
//   Game game = Game(6, 3, keyboard, word);

//   game.addLetter('வ');
//   game.addLetter('ச');

//   game.addLetter('ம்');

//   print(game.wordCheck());
// }
