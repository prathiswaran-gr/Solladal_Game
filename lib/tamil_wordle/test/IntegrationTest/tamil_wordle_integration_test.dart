// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/allowed_words.dart';
import 'package:tamil_wordle/src/status.dart';
import 'package:tamil_wordle/src/tile.dart';
import 'package:tamil_wordle/src/tile_border_color.dart';
import 'package:tamil_wordle/tamil_wordle.dart';
import 'package:test/test.dart';

void main() {
  Database database = Database();
  Word word = Word(database);
  Keyboard keyboard = Keyboard(word.keyList);
  int rows = 6;
  int columns = 5;
  Game game = Game(rows, columns, keyboard, word);

  //'Group of Database Getter Methods Test'
  group('Group of Database Getter Methods Test', () {
    //Getter for SecretWord Method Test
    test('Get Secret Word Test', () {
      expect(database.secretWord, 'திருமணம');
    });

    //Getter for WordList Method Test
    test('Get WordList Test', () {
      expect(database.wordList, [
        ['சந்தனம்', null, null, null],
        ['மயக்கம்', null, null, null],
        ['தயக்கம்', null, null, null],
        ['திருமணம்', null, null, null],
        ['நடப்பது', null, null, null],
        ['கதிரவன்', null, null, null],
        [
          'சந்திரன்',
          'https://www.google.co.in',
          'https://www.amazon.in/',
          'https://www.flipkart.com'
        ],
        ['கடிகாரம்', null, null, null],
        ['இலைகள்', null, null, null],
        ['திரவியம்', null, null, null],
        ['பொருத்துக', null, null, null],
        ['திருமணம', null, null, null],
        ['ருயக்கம', null, null, null]
      ]);
    });

    //Getter for KeyList  Method Test
    test('Get KeyList Test', () {
      expect(database.keyList, [
        'ன்',
        'ம்',
        'க்',
        'ன',
        'டி',
        'ட',
        'ந்',
        'வ',
        'ழ',
        'ரு',
        'க',
        'ம',
        'ப',
        'ய',
        'த',
        'ர',
        'கா',
        'வி',
        'கு',
        'ண',
        'ச',
        'தி',
        'தை',
        'ந',
        'ப்',
        'து',
        'பொ',
        'த்'
      ]);
    });
  });

  group('A group of Word Class Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    //Secret Word Getter Method Test
    test('Get Secret Word Test', () {
      expect(word.secretWord, 'திருமணம');
    });

    //WordList Getter Method Test
    test('Get Word List Without Audio, Video, Image Test', () {
      var expectedWordList = {
        'சந்தனம்': AllowedWords.wordonly('சந்தனம்'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'நடப்பது': AllowedWords.wordonly('நடப்பது'),
        'கதிரவன்': AllowedWords.wordonly('கதிரவன்'),
        'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'இலைகள்': AllowedWords.wordonly('இலைகள்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'பொருத்துக': AllowedWords.wordonly('பொருத்துக'),
        'திருமணம': AllowedWords.wordonly('திருமணம'),
        'ருயக்கம': AllowedWords.wordonly('ருயக்கம')
      };

      expect(word.wordList.length, expectedWordList.length);
      expect(
          word.wordList['திருமணம்']!.word, expectedWordList['திருமணம்']!.word);

      expect(word.wordList['திருமணம்']!.audio == null, true);
      expect(word.wordList['திருமணம்']!.image == null, true);
      expect(word.wordList['திருமணம்']!.video == null, true);
    });

    test('Get Word List With Audio, Video, Image Test', () {
      var expectedWordList = {
        'சந்தனம்': AllowedWords.wordonly('சந்தனம்'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'நடப்பது': AllowedWords.wordonly('நடப்பது'),
        'கதிரவன்': AllowedWords.wordonly('கதிரவன்'),
        'சந்திரன்': AllowedWords(
            'சந்திரன்',
            Uri.parse('https://www.google.co.in'),
            Uri.parse('https://www.amazon.in/'),
            Uri.parse('https://www.flipkart.com')),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'இலைகள்': AllowedWords.wordonly('இலைகள்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'பொருத்துக': AllowedWords.wordonly('பொருத்துக'),
        'திருமணம': AllowedWords.wordonly('திருமணம'),
        'ருயக்கம': AllowedWords.wordonly('ருயக்கம')
      };
      expect(word.wordList.length, expectedWordList.length);
      expect(
          word.wordList['சந்திரன்']!.word, expectedWordList['சந்திரன்']!.word);

      expect(word.wordList['சந்திரன்']!.audio!.data,
          Uri.parse('https://www.google.co.in').data);
      expect(word.wordList['சந்திரன்']!.image!.data,
          Uri.parse('https://www.amazon.in/').data);
      expect(word.wordList['சந்திரன்']!.video!.data,
          Uri.parse('https://www.flipkart.com').data);
    });

    //KeyListGetter Method Test
    test('Get Key List Test', () {
      expect(word.keyList, [
        'ன்',
        'ம்',
        'க்',
        'ன',
        'டி',
        'ட',
        'ந்',
        'வ',
        'ழ',
        'ரு',
        'க',
        'ம',
        'ப',
        'ய',
        'த',
        'ர',
        'கா',
        'வி',
        'கு',
        'ண',
        'ச',
        'தி',
        'தை',
        'ந',
        'ப்',
        'து',
        'பொ',
        'த்'
      ]);
    });

    //Validate Tamil letter Aa to Ha Sequence Method Test
    test(' ValidateKaSequence Method Test', () {
      expect(word.validateKaSequence(2949, 'ம'), 2949);
    });

    //Validate Tamil letter Aa to Ha Sequence Method throws Exception Test
    test('.parse() fails on invalid input', () {
      expect(() => word.validateKaSequence(3020, 'ௌ'), throwsFormatException);
    });

    //GetLetter Method Test - It returns the List<String>
    test('getLetter Method Return Value Test', () {
      expect(word.getLetters(), ['தி', 'ரு', 'ம', 'ண', 'ம']);
    });

    //GetLetter Method Returs The List Length has 5 -Test
    test('getLetter Method Return Value length Test', () {
      expect((word.getLetters()).length, 5);
    });
  });

  //'Keyboard Key Background Color Enum Test'
  group('Enum Keyboard Key Background Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Keyboard Key BG Color Enum Consists Correct Value Test', () {
      expect(keyboardKeyBGColor.green is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.yellow is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.darkGrey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.grey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightGreen is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightYellow is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightDarkGrey is keyboardKeyBGColor, true);
      expect(keyboardKeyBGColor.lightGrey is keyboardKeyBGColor, true);
    });
  });

  //'Keyboard Key Foreground Color Enum Test'
  group('Enum Keyboard Key Foreground Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Keyboard Key FG Color Enum Consists Correct Value Test', () {
      expect(keyboardKeyFGColor.black is keyboardKeyFGColor, true);
      expect(keyboardKeyFGColor.white is keyboardKeyFGColor, true);
      expect(keyboardKeyFGColor.lightBlack is keyboardKeyFGColor, true);
    });
  });

  //'Tile Background Color Enum Test'
  group('Enum Tile Background Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Background Color Enum Consists Correct Value Test', () {
      expect(TileBGColor.white is TileBGColor, true);
      expect(TileBGColor.darkGrey is TileBGColor, true);
      expect(TileBGColor.lightGrey is TileBGColor, true);
      expect(TileBGColor.green is TileBGColor, true);
      expect(TileBGColor.yellow is TileBGColor, true);
    });
  });

  //'Tile Foreground Color Enum Test'
  group('Enum Tile Foreground Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Foreground Color Enum Consists Correct Value Test', () {
      expect(TileFGColor.white is TileFGColor, true);
      expect(TileFGColor.white is TileFGColor, true);
    });
  });

  //'Tile Border Color Enum Test'
  group('Enum Tile Border Color Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Tile Border Color Enum Consists Correct Value Test', () {
      expect(TileBorderColor.darkGrey is TileBorderColor, true);
      expect(TileBorderColor.lightGrey is TileBorderColor, true);
      expect(TileBorderColor.green is TileBorderColor, true);
      expect(TileBorderColor.green is TileBorderColor, true);
    });
  });

  //'Word Status Enum Test'
  group('Word Status Enum Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Word Status Enum Consists Correct Value Test', () {
      expect(WordStatus.success is WordStatus, true);
      expect(WordStatus.alreadyExist is WordStatus, true);
      expect(WordStatus.notInWordList is WordStatus, true);
    });
  });

  //'Game Status Enum Test'
  group('Game Status Enum Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Game Status Enum Consists Correct Value Test', () {
      expect(Status.inProgress is Status, true);
      expect(Status.lose is Status, true);
      expect(Status.win is Status, true);
    });
  });

  //Keyboard Class Test
  group('Keyboard Key And Value Test ', () {
    //Keyboard Object Creation
    Keyboard keyboard = Keyboard(word.keyList);

    //Keyboard Map Test for Map Key Get the Correct Value
    test('Default Key Color Test', () {
      expect(keyboard.keyboardMap['ன்']!.letter, 'ன்');
      expect(keyboard.keyboardMap['ன்']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(keyboard.keyboardMap['ன்']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
    });

    //Keyboard isEnabled Property Test
    test('isEnabled Property Test', () {
      expect(keyboard.isEnabled, true);

      keyboard.isEnabled = false;
      expect(keyboard.isEnabled, false);
    });
  });

  //'Tile Class Test'
  group('Tile Class Test', () {
    //Pass the Letter and Background Color Value via Parameterized Constructor and Get the Letter and Background Color - Getter Method Test
    test('Parameteraized Constructor Test', () {
      Tile tile = Tile('ம்', Helper.getTileBGColor(TileBGColor.white),
          Helper.getTileFGColor(TileFGColor.white));
      expect(tile.letter, 'ம்');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.white));
    });

    //Pass the single Tile Background Color Value via Named Constructor and Get the Letter and Background Color - Getter Method Test
    test('Named Constructor Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letter, '');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.black));
    });

    //Set and Get Method for Letter Test
    test('Set Letter Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.letter = 'ம்';
      expect(tile.letter, 'ம்');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.black));
    });

    //Set and Get for Tile Background Color Test
    test('Set Tile Background Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.bgColor = Helper.getTileBGColor(TileBGColor.white);
      expect(tile.letter, '');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.black));
    });

    //Set and Get for Tile Foreground Color Test
    test('Set Tile Background Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.letterColor = Helper.getTileFGColor(TileFGColor.white);
      expect(tile.letter, '');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.white));
    });

    //Set and Get for Tile Flipped Letter and It's BG Color Test
    test('Set Tile Flipped Letter and Its BG Color Test', () {
      Tile tile = Tile.withoutLetter(Helper.getTileBGColor(TileBGColor.white));
      tile.letterColor = Helper.getTileFGColor(TileFGColor.white);
      tile.flippedLetterColor = 'white';
      tile.flippedBGColor = 'green';

      expect(tile.letter, '');
      expect(tile.bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(tile.letterColor, Helper.getTileFGColor(TileFGColor.white));
      expect(tile.flippedLetterColor, 'white');
      expect(tile.flippedBGColor, 'green');
    });
  });

  //Helper Class Test

  group('Helper Class Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    //Get Keyboard Key BG Color Method Test
    test('Get Keyboard Key BG Color Method Test', () {
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey),
          'darkGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green),
          'green');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          'grey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightDarkGrey),
          'lightDarkGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGreen),
          'lightGreen');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightGrey),
          'lightGrey');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.lightYellow),
          'lightYellow');
      expect(Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow),
          'yellow');
    });

    //Get Keyboard Key FG Color Method Test
    test('Get Keyboard Key BG Color Method Test', () {
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black),
          'black');
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.lightBlack),
          'lightBlack');
      expect(Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.white),
          'white');
    });

    //Get Tile BG Color Method Test
    test('Get Tile BG Color Method Test', () {
      expect(Helper.getTileBGColor(TileBGColor.darkGrey),
          'darkGrey');
      expect(Helper.getTileBGColor(TileBGColor.lightGrey),
          'lightGrey');
      expect(Helper.getTileBGColor(TileBGColor.green),
          'green');
      expect(Helper.getTileBGColor(TileBGColor.yellow),
          'yellow');
      expect(Helper.getTileBGColor(TileBGColor.white),
          'white');
    });

    //Get Tile FG Color Method Test
    test('Get Tile FG Color Method Test', () {
      expect(Helper.getTileFGColor(TileFGColor.black),
          'black');
      expect(Helper.getTileFGColor(TileFGColor.white),
          'white');
    });

    //Get Tile Border Color Method Test
    test('Get Tile Border Color Method Test', () {
      expect(Helper.getTileBorderColor(TileBorderColor.darkGrey),
          'darkGrey');
      expect(Helper.getTileBorderColor(TileBorderColor.lightGrey),
          'lightGrey');
      expect(Helper.getTileBorderColor(TileBorderColor.green),
          'green');
      expect(Helper.getTileBorderColor(TileBorderColor.yellow),
          'yellow');
    });

  });


  //Game Class Test
  group('A Group of Game Code Test', () {
    //Validating the CurrentWordList has Empty Value Test
    test('Check Current WordList has Empty Value Test', () {
      expect(game.currentWord, []);
    });

    //Test for Validate the Default Game Keyboard Properties
    test('Check Keyboard Properties Test', () {
      expect(game.keyboard.keyboardMap['ன்']!.letter, 'ன்');
      expect(game.keyboard.keyboardMap['ன்']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap['ன்']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
    });

    //Can AddLetter Method Check Test
    test('Can Add Letter  Test', () {
      expect(game.canAddLetter, isTrue);
    });

    test('Can Remove Letter  Test', () {
      expect(game.canRemoveLetter, isFalse);
    });

    test('Can Add Letter Failed Test', () {
      // Test Setup Adding the word 'வணக்கம்'
      game.addLetter('வ');
      game.addLetter('ண');
      game.addLetter('க்');
      game.addLetter('க');
      game.addLetter('ம்');

      // Asset to make sure that letter can't be added
      expect(game.canAddLetter, isFalse);

      //Test Clean-up Removing the added word ('வணக்கம்')
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();

      //Verfiying the word Clean-up
      expect(game.board[0][0].letter, '');
    });

    test('Add Letter in Both CurrentWord and BoardTile Test', () {
      //Adding the Letter 'வ'
      game.addLetter('வ');

      //Validating the Board Tile Letter and CurrentWord List
      expect(game.currentWord, ['வ']);
      expect(game.board[0][0].letter, 'வ');

      //Adding the Letter 'ண'
      game.addLetter('ண');

      //Validating the Board Tile Letter and CurrentWord List
      expect(game.currentWord, ['வ', 'ண']);
      expect(game.board[0][1].letter, 'ண');

      //Clean-up
      game.removeLetter();
      game.removeLetter();

      //Validating the Clean-up
      expect(game.currentWord, []);
      expect(game.board[0][0].letter, '');
    });

    test('Remove Letter in Both CurrentWord and BoardTile Test', () {
      //Initializing Test
      game.addLetter('வ');
      game.addLetter('ண');

      //Validating Initialization
      expect(game.currentWord, ['வ', 'ண']);
      expect(game.board[0][1].letter, 'ண');

      //Removing Letter Test
      game.removeLetter();
      game.removeLetter();

      //Validating Remove Letter Test
      expect(game.currentWord, []);
      expect(game.board[0][0].letter, '');
    });

    test('Word Check Method Test', () {
      //testGame New Object is Created For This Particular Block Test
      Game testGame = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      testGame.addLetter('ச');
      testGame.addLetter('ந்');
      testGame.addLetter('தி');
      testGame.addLetter('ர');
      testGame.addLetter('ன்');

      //Validate the CurrentWord List
      expect(testGame.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(testGame.currentWord.join(), 'சந்திரன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      testGame.wordCheck();

      //Validating the Board Tile Background Color
      expect(testGame.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[0][0].letter, 'ச');
      expect(testGame.board[0][1].letter, 'ந்');
      expect(testGame.board[0][2].letter, 'தி');
      expect(testGame.board[0][3].letter, 'ர');
      expect(testGame.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord List has Empty.
      expect(testGame.currentWord, []);

      //Clean-up - Resetting the Keyboard
      testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test('Word Check Method Reurns Word Not in the WordList Value Test', () {
      //testGame New Object is Created For This Particular Block Test
      Game testGame = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is not present in the WordList
      testGame.addLetter('ச');
      testGame.addLetter('ந்');
      testGame.addLetter('த');
      testGame.addLetter('ன');
      testGame.addLetter('ன்');

      //Validating the CurrentWord List
      expect(testGame.currentWord, ['ச', 'ந்', 'த', 'ன', 'ன்']);
      expect(testGame.currentWord.join(), 'சந்தனன்');

      //Validating the WordCheck Method Has Return the Value has Not in the WordList
      expect(testGame.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(testGame.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[0][0].letter, 'ச');
      expect(testGame.board[0][1].letter, 'ந்');
      expect(testGame.board[0][2].letter, 'த');
      expect(testGame.board[0][3].letter, 'ன');
      expect(testGame.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();

      //Validating the Clean-up
      expect(testGame.currentWord, []);
    });

    test('Word Check Method Returs Word is Already Exist Test', () {
      //testGame New Object is Created For This Particular Block Test
      Game testGame = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      testGame.addLetter('ச');
      testGame.addLetter('ந்');
      testGame.addLetter('தி');
      testGame.addLetter('ர');
      testGame.addLetter('ன்');

      //Validate the CurrentWord List
      expect(testGame.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(testGame.currentWord.join(), 'சந்திரன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      testGame.wordCheck();

      //Validating the Board Tile Background Color
      expect(testGame.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[0][0].letter, 'ச');
      expect(testGame.board[0][1].letter, 'ந்');
      expect(testGame.board[0][2].letter, 'தி');
      expect(testGame.board[0][3].letter, 'ர');
      expect(testGame.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord List has Empty.
      expect(testGame.currentWord, []);

      testGame.addLetter('ச');
      testGame.addLetter('ந்');
      testGame.addLetter('தி');
      testGame.addLetter('ர');
      testGame.addLetter('ன்');

      //Validate the CurrentWord List
      expect(testGame.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(testGame.currentWord.join(), 'சந்திரன்');

      //Validating the WordCheck Method Has Return the Value has Word is Already Exist Test
      expect(testGame.wordCheck(), WordStatus.alreadyExist);

      //Validating the Board Tile Background Color
      expect(testGame.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[1][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[1][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[1][0].letter, 'ச');
      expect(testGame.board[1][1].letter, 'ந்');
      expect(testGame.board[1][2].letter, 'தி');
      expect(testGame.board[1][3].letter, 'ர');
      expect(testGame.board[1][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();

      //Validating the Clean-up
      expect(testGame.currentWord, []);

      //Clean-up - Resetting the Keyboard
      testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test('Word Check Method with Correct Input Test', () {
      //Word Check Method Test for Correct Input.
      //testGame New Object is Created For This Particular Block Test
      Game testGame = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      testGame.addLetter('தி');
      testGame.addLetter('ரு');
      testGame.addLetter('ம');
      testGame.addLetter('ண');
      testGame.addLetter('ம');

      //Validating the CurrentWord List
      expect(testGame.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம']);
      expect(testGame.currentWord.join(), 'திருமணம');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      testGame.wordCheck();

      //Validating the Board Tile Background Color
      expect(testGame.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[0][0].letter, 'தி');
      expect(testGame.board[0][1].letter, 'ரு');
      expect(testGame.board[0][2].letter, 'ம');
      expect(testGame.board[0][3].letter, 'ண');
      expect(testGame.board[0][4].letter, 'ம');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(testGame.currentWord, []);

      //Clean-up - Resetting the Keyboard
      testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test('Disble Keyboard  Test', () {
      //Word Check Method Test for Correct Input.
      //testGame New Object is Created For This Particular Block Test
      Game testGame = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      testGame.addLetter('ரு');
      testGame.addLetter('ய');
      testGame.addLetter('க்');
      testGame.addLetter('க');
      testGame.addLetter('ம');

      //Validating the CurrentWord List
      expect(testGame.currentWord, ['ரு', 'ய', 'க்', 'க', 'ம']);
      expect(testGame.currentWord.join(), 'ருயக்கம');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      testGame.wordCheck();

      //Validating the Board Tile Background Color
      expect(testGame.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(testGame.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(testGame.board[0][0].letter, 'ரு');
      expect(testGame.board[0][1].letter, 'ய');
      expect(testGame.board[0][2].letter, 'க்');
      expect(testGame.board[0][3].letter, 'க');
      expect(testGame.board[0][4].letter, 'ம');

      //Validating the Keyboard Key Background Color
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(testGame.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is present in the WordList and disable keyboard method call.
      testGame.addLetter('தி');
      testGame.addLetter('ரு');
      testGame.addLetter('ம');
      testGame.addLetter('ண');
      testGame.addLetter('ம');
      //Disable Keyboard Method Call
      testGame.addLetter('தி');

      //Validating the CurrentWord List
      expect(testGame.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம']);
      expect(testGame.currentWord.join(), 'திருமணம');

      //Disable Keyboard Key BG Color Test

      expect(testGame.keyboard.keyboardMap['ரு']!.bgColor, 'lightYellow');
      expect(testGame.keyboard.keyboardMap['ய']!.bgColor, 'lightDarkGrey');
      expect(testGame.keyboard.keyboardMap['க்']!.bgColor, 'lightDarkGrey');
      expect(testGame.keyboard.keyboardMap['க']!.bgColor, 'lightDarkGrey');
      expect(testGame.keyboard.keyboardMap['ம']!.bgColor, 'lightGreen');
      expect(testGame.keyboard.keyboardMap['தி']!.bgColor, 'lightGrey');

      //Clean-up the Board Tile Current Row
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();
      testGame.removeLetter();

      //Clean-up - Resetting the Keyboard
      testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          testGame.keyboard.keyboardMap[testGame.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });


    test('Word Check Method with Multiple Entry Test', () {
      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is also present in the WordList
      game.addLetter('ச');
      game.addLetter('ந்');
      game.addLetter('தி');
      game.addLetter('ர');
      game.addLetter('ன்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(game.currentWord.join(), 'சந்திரன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[0][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][2].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][3].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][4].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[0][0].letter, 'ச');
      expect(game.board[0][1].letter, 'ந்');
      expect(game.board[0][2].letter, 'தி');
      expect(game.board[0][3].letter, 'ர');
      expect(game.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(game.keyboard.keyboardMap[game.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Check the Current Word List Has Empty.
      expect(game.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      game.addLetter('ச');
      game.addLetter('ந்');
      game.addLetter('த');
      game.addLetter('ன');
      game.addLetter('ன்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'ந்', 'த', 'ன', 'ன்']);
      expect(game.currentWord.join(), 'சந்தனன்');

      //Validating the WordCheck Method Has Return the Value has Not in the WordList
      expect(game.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(
          game.board[1][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][2].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][3].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][4].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[1][0].letter, 'ச');
      expect(game.board[1][1].letter, 'ந்');
      expect(game.board[1][2].letter, 'த');
      expect(game.board[1][3].letter, 'ன');
      expect(game.board[1][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();

      //Validating the Clean-up
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('தி');
      game.addLetter('ரு');
      game.addLetter('ம');
      game.addLetter('ண');
      game.addLetter('ம');

      //Validating the CurrentWord List
      expect(game.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம']);
      expect(game.currentWord.join(), 'திருமணம');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[1][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][2].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][3].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][4].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[1][0].letter, 'தி');
      expect(game.board[1][1].letter, 'ரு');
      expect(game.board[1][2].letter, 'ம');
      expect(game.board[1][3].letter, 'ண');
      expect(game.board[1][4].letter, 'ம');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(game.currentWord, []);
      //Clean-up - Resetting the Keyboard
      game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test(
        'Word Check Method with Multiple Entry Test -  6th Try has Correct Answer',
        () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('ன்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(gameTest.currentWord.join(), 'சந்திரன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Letter
      expect(gameTest.board[0][0].letter, 'ச');
      expect(gameTest.board[0][1].letter, 'ந்');
      expect(gameTest.board[0][2].letter, 'தி');
      expect(gameTest.board[0][3].letter, 'ர');
      expect(gameTest.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Check the Current Word List Has Empty.
      expect(gameTest.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');
      gameTest.addLetter('ன');
      gameTest.addLetter('ன்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த', 'ன', 'ன்']);
      expect(gameTest.currentWord.join(), 'சந்தனன்');

      //Validating the WordCheck Method Has Return the Value has Word Not in the WordList
      expect(gameTest.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ச');
      expect(gameTest.board[1][1].letter, 'ந்');
      expect(gameTest.board[1][2].letter, 'த');
      expect(gameTest.board[1][3].letter, 'ன');
      expect(gameTest.board[1][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
      expect(gameTest.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is present in the WordList
      gameTest.addLetter('ம');
      gameTest.addLetter('ய');
      gameTest.addLetter('க்');
      gameTest.addLetter('க');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ம', 'ய', 'க்', 'க', 'ம்']);
      expect(gameTest.currentWord.join(), 'மயக்கம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ம');
      expect(gameTest.board[1][1].letter, 'ய');
      expect(gameTest.board[1][2].letter, 'க்');
      expect(gameTest.board[1][3].letter, 'க');
      expect(gameTest.board[1][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Third Row - our Entering the word is present in the WordList
      gameTest.addLetter('த');
      gameTest.addLetter('ய');
      gameTest.addLetter('க்');
      gameTest.addLetter('க');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['த', 'ய', 'க்', 'க', 'ம்']);
      expect(gameTest.currentWord.join(), 'தயக்கம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[2][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[2][0].letter, 'த');
      expect(gameTest.board[2][1].letter, 'ய');
      expect(gameTest.board[2][2].letter, 'க்');
      expect(gameTest.board[2][3].letter, 'க');
      expect(gameTest.board[2][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Fourth Row using GetLetter Method
      gameTest.addLetter('க');
      gameTest.addLetter('டி');
      gameTest.addLetter('கா');
      gameTest.addLetter('ர');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['க', 'டி', 'கா', 'ர', 'ம்']);
      expect(gameTest.currentWord.join(), 'கடிகாரம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[3][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[3][0].letter, 'க');
      expect(gameTest.board[3][1].letter, 'டி');
      expect(gameTest.board[3][2].letter, 'கா');
      expect(gameTest.board[3][3].letter, 'ர');
      expect(gameTest.board[3][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Fifth Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ரு');
      gameTest.addLetter('ம');
      gameTest.addLetter('ண');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம்']);
      expect(gameTest.currentWord.join(), 'திருமணம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[4][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[4][0].letter, 'தி');
      expect(gameTest.board[4][1].letter, 'ரு');
      expect(gameTest.board[4][2].letter, 'ம');
      expect(gameTest.board[4][3].letter, 'ண');
      expect(gameTest.board[4][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Sixth(Last Chance) Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ரு');
      gameTest.addLetter('ம');
      gameTest.addLetter('ண');
      gameTest.addLetter('ம');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம']);
      expect(gameTest.currentWord.join(), 'திருமணம');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[5][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[5][0].letter, 'தி');
      expect(gameTest.board[5][1].letter, 'ரு');
      expect(gameTest.board[5][2].letter, 'ம');
      expect(gameTest.board[5][3].letter, 'ண');
      expect(gameTest.board[5][4].letter, 'ம');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test(
        'Word Check Method with Multiple Entry Test -  6th Try has Wrong Answer',
        () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, keyboard, word);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('ன்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(gameTest.currentWord.join(), 'சந்திரன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Letter
      expect(gameTest.board[0][0].letter, 'ச');
      expect(gameTest.board[0][1].letter, 'ந்');
      expect(gameTest.board[0][2].letter, 'தி');
      expect(gameTest.board[0][3].letter, 'ர');
      expect(gameTest.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Check the Current Word List Has Empty.
      expect(gameTest.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');
      gameTest.addLetter('ன');
      gameTest.addLetter('ன்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த', 'ன', 'ன்']);
      expect(gameTest.currentWord.join(), 'சந்தனன்');

      //Validating the WordCheck Method Has Return the Value has Word Not in the WordList
      expect(gameTest.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ச');
      expect(gameTest.board[1][1].letter, 'ந்');
      expect(gameTest.board[1][2].letter, 'த');
      expect(gameTest.board[1][3].letter, 'ன');
      expect(gameTest.board[1][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
      expect(gameTest.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is present in the WordList
      gameTest.addLetter('ம');
      gameTest.addLetter('ய');
      gameTest.addLetter('க்');
      gameTest.addLetter('க');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ம', 'ய', 'க்', 'க', 'ம்']);
      expect(gameTest.currentWord.join(), 'மயக்கம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ம');
      expect(gameTest.board[1][1].letter, 'ய');
      expect(gameTest.board[1][2].letter, 'க்');
      expect(gameTest.board[1][3].letter, 'க');
      expect(gameTest.board[1][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Third Row - our Entering the word is present in the WordList
      gameTest.addLetter('த');
      gameTest.addLetter('ய');
      gameTest.addLetter('க்');
      gameTest.addLetter('க');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['த', 'ய', 'க்', 'க', 'ம்']);
      expect(gameTest.currentWord.join(), 'தயக்கம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[2][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[2][0].letter, 'த');
      expect(gameTest.board[2][1].letter, 'ய');
      expect(gameTest.board[2][2].letter, 'க்');
      expect(gameTest.board[2][3].letter, 'க');
      expect(gameTest.board[2][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Fourth Row using GetLetter Method
      gameTest.addLetter('க');
      gameTest.addLetter('டி');
      gameTest.addLetter('கா');
      gameTest.addLetter('ர');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['க', 'டி', 'கா', 'ர', 'ம்']);
      expect(gameTest.currentWord.join(), 'கடிகாரம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[3][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[3][0].letter, 'க');
      expect(gameTest.board[3][1].letter, 'டி');
      expect(gameTest.board[3][2].letter, 'கா');
      expect(gameTest.board[3][3].letter, 'ர');
      expect(gameTest.board[3][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Fifth Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ரு');
      gameTest.addLetter('ம');
      gameTest.addLetter('ண');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம்']);
      expect(gameTest.currentWord.join(), 'திருமணம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[4][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[4][0].letter, 'தி');
      expect(gameTest.board[4][1].letter, 'ரு');
      expect(gameTest.board[4][2].letter, 'ம');
      expect(gameTest.board[4][3].letter, 'ண');
      expect(gameTest.board[4][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Sixth(Last Chance) Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('வி');
      gameTest.addLetter('ய');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ர', 'வி', 'ய', 'ம்']);
      expect(gameTest.currentWord.join(), 'திரவியம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[5][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[5][0].letter, 'தி');
      expect(gameTest.board[5][1].letter, 'ர');
      expect(gameTest.board[5][2].letter, 'வி');
      expect(gameTest.board[5][3].letter, 'ய');
      expect(gameTest.board[5][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });
  });
}
