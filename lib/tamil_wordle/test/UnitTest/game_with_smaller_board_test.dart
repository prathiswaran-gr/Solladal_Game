import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tamil_wordle/src/allowed_words.dart';
import 'package:tamil_wordle/src/key.dart';
import 'package:tamil_wordle/src/tile_border_color.dart';
import 'package:tamil_wordle/tamil_wordle.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'game_with_smaller_board_test.mocks.dart';

//Create the Mock Word for word.dart file used to test the Game Class Testing
//Create the Mock Keyboard for keyboard.dart file used to test the Game Class Testing
@GenerateMocks([Keyboard])
@GenerateMocks([Word])
void main() {
  group('Game With Smaller Board Code Test', () {
    //MockWord Object Creation
    MockWord mockWord = MockWord();
    //MockKeyboard Object Creation
    MockKeyboard mockKeyboard = MockKeyboard();

    //Initialize the Rows and Column Values for Game Constructor Access
    int rows = 6;
    int columns = 3;

    //Create Stubs for Word Object
    when(mockWord.secretWord).thenReturn('தினம்');
    when(mockWord.wordList).thenReturn({
      'சரம்': AllowedWords.wordonly('சரம்'),
      'மானம்': AllowedWords.wordonly('மானம்'),
      'தனம்': AllowedWords.wordonly('தனம்'),
      'சதம்': AllowedWords.wordonly('சதம்'),
      'தினம்': AllowedWords.wordonly('தினம்'),
      'ரதம்': AllowedWords.wordonly('ரதம்'),
      'வாழ்க': AllowedWords.wordonly('வாழ்க'),
      'ரதிம்': AllowedWords.wordonly('ரதிம்'),
    });
    when(mockWord.keyList).thenReturn([
      'ம்',
      'க்',
      'ன',
      'ச',
      'ந்',
      'தி',
      'ர',
      'ன்',
      'த',
      'மா',
      'வா',
      'ழ்',
      'க'
    ]);
    when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

    //Create Stubs for Keyboard Object
    when(mockKeyboard.keyboardMap).thenReturn({
      'ம்': Key('ம்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'க்': Key('க்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ன': Key('ன', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ச': Key('ச', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ந்': Key('ந்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'தி': Key('தி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ர': Key('ர', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ன்': Key('ன்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'த': Key('த', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'மா': Key('மா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'வா': Key('வா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ழ்': Key('ழ்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'க': Key('க', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
    });

    Game game = Game(rows, columns, mockKeyboard, mockWord);

    setUp(() {
      mockWord = MockWord();
      mockKeyboard = MockKeyboard();

      //Create Stubs for Word Object
      when(mockWord.secretWord).thenReturn('தினம்');
      when(mockWord.wordList).thenReturn({
        'சரம்': AllowedWords.wordonly('சரம்'),
        'மானம்': AllowedWords.wordonly('மானம்'),
        'தனம்': AllowedWords.wordonly('தனம்'),
        'சதம்': AllowedWords.wordonly('சதம்'),
        'தினம்': AllowedWords.wordonly('தினம்'),
        'ரதம்': AllowedWords.wordonly('ரதம்'),
        'வாழ்க': AllowedWords.wordonly('வாழ்க'),
        'ரதிம்': AllowedWords.wordonly('ரதிம்'),
      });
      when(mockWord.keyList).thenReturn([
        'ம்',
        'க்',
        'ன',
        'ச',
        'ந்',
        'தி',
        'ர',
        'ன்',
        'த',
        'மா',
        'வா',
        'ழ்',
        'க'
      ]);
      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Create Stubs for Keyboard Object
      when(mockKeyboard.keyboardMap).thenReturn({
        'ம்': Key('ம்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'க்': Key('க்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ன': Key('ன', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ச': Key('ச', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ந்': Key('ந்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'தி': Key('தி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ர': Key('ர', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ன்': Key('ன்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'த': Key('த', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'மா': Key('மா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'வா': Key('வா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ழ்': Key('ழ்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'க': Key('க', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      });
      game = Game(rows, columns, mockKeyboard, mockWord);
    });

    test('Check Current WordList has Empty Value Test', () {
      //Validating the CurrentWordList has Empty Value
      expect(game.currentWord, []);
    });

    test('Check Keyboard Map Test', () {
      //Validating the Keyboard Map via Game Object
      expect(game.keyboard.keyboardMap['ம்']!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap['ம்']!.letterColor,
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black));
    });

    test('Check Tile Properties Test', () {
      //Validate the Default Game Board Tile Properties
      expect(game.board[0][0].letter, '');
      expect(game.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
    });

    test('Can Add Letter  Test', () {
      //Can AddLetter Method Check Test
      expect(game.canAddLetter, isTrue);
    });

    test('Can Remove Letter  Test', () {
      //Can AddLetter Method Check Test
      expect(game.canRemoveLetter, isFalse);
    });

    test('Can Add Letter Failed Test', () {
      // Test Setup Adding the word 'வணக்கம்'
      game.addLetter('வ');
      game.addLetter('ண');
      game.addLetter('க்');

      // Asset to make sure that letter can't be added
      expect(game.canAddLetter, isFalse);

      //Test Clean-up Removing the added word ('வணக்கம்')
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
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('ர');
      gameTest.addLetter('த');
      gameTest.addLetter('ம்');

      //Validate the CurrentWord List
      expect(gameTest.currentWord, ['ர', 'த', 'ம்']);
      expect(gameTest.currentWord.join(), 'ரதம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'ர');
      expect(gameTest.board[0][1].letter, 'த');
      expect(gameTest.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
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
    });

    test('Word Check Method Reurns Word Not in the WordList Value Test', () {
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is not present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த']);
      expect(gameTest.currentWord.join(), 'சந்த');

      //Validating the WordCheck Method Has Return the Value has Word Not in WordList
      expect(gameTest.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));

      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'ச');
      expect(gameTest.board[0][1].letter, 'ந்');
      expect(gameTest.board[0][2].letter, 'த');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
      expect(gameTest.currentWord, []);
    });

    test('Word Check Method Reurn Word is Aleady Exist Test', () {
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('ர');
      gameTest.addLetter('த');
      gameTest.addLetter('ம்');

      //Validate the CurrentWord List
      expect(gameTest.currentWord, ['ர', 'த', 'ம்']);
      expect(gameTest.currentWord.join(), 'ரதம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      
      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'ர');
      expect(gameTest.board[0][1].letter, 'த');
      expect(gameTest.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Enter the Already Exist Word
      gameTest.addLetter('ர');
      gameTest.addLetter('த');
      gameTest.addLetter('ம்');

      //Validate the CurrentWord List
      expect(gameTest.currentWord, ['ர', 'த', 'ம்']);
      expect(gameTest.currentWord.join(), 'ரதம்');

      //Validating the WordCheck Method Has Return the Value has Word is Already Exist
      expect(gameTest.wordCheck(), WordStatus.alreadyExist);

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[1][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[1][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[1][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));

      //Validating the Board Tile Border Color
      expect(gameTest.board[1][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[1][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[1][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[1][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ர');
      expect(gameTest.board[1][1].letter, 'த');
      expect(gameTest.board[1][2].letter, 'ம்');

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
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
    });

    test('Word Check Method with Correct Input Test', () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('தி');
      gameTest.addLetter('ன');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ன', 'ம்']);
      expect(gameTest.currentWord.join(), 'தினம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'தி');
      expect(gameTest.board[0][1].letter, 'ன');
      expect(gameTest.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
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
    });

    test('Disable Keyboard Test', () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('ர');
      gameTest.addLetter('தி');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ர', 'தி', 'ம்']);
      expect(gameTest.currentWord.join(), 'ரதிம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.yellow));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.yellow));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'ர');
      expect(gameTest.board[0][1].letter, 'தி');
      expect(gameTest.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Disable Keyboard Method Test
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');
      ////Disable Keyboard Method call
      gameTest.addLetter('த');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த']);
      expect(gameTest.currentWord.join(), 'சந்த');

      //Disable Keyboard Key BG Color Test
      expect(gameTest.keyboard.keyboardMap['ர']!.bgColor, 'lightDarkGrey');
      expect(gameTest.keyboard.keyboardMap['தி']!.bgColor, 'lightYellow');
      expect(gameTest.keyboard.keyboardMap['ம்']!.bgColor, 'lightGreen');
      expect(gameTest.keyboard.keyboardMap['த']!.bgColor, 'lightGrey');

      //Clean-up the Board Tile Current Row
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
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
    });

    test(
        'Word Check Method with Multiple Entry Test - 6th Try has Correct Word',
        () {
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);
      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
      gameTest.addLetter('ர');
      gameTest.addLetter('த');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ர', 'த', 'ம்']);
      expect(gameTest.currentWord.join(), 'ரதம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Letter
      expect(gameTest.board[0][0].letter, 'ர');
      expect(gameTest.board[0][1].letter, 'த');
      expect(gameTest.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Check the Current Word List Has Empty.
      expect(gameTest.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த']);
      expect(gameTest.currentWord.join(), 'சந்த');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Validating the WordCheck Method Has Return the Value has Not in the WordList
      expect(gameTest.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[1][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[1][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(gameTest.board[1][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));

      //Validating the Board Tile Border Color
      expect(gameTest.board[1][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[1][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(gameTest.board[1][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[1][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ச');
      expect(gameTest.board[1][1].letter, 'ந்');
      expect(gameTest.board[1][2].letter, 'த');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      gameTest.addLetter('ச');
      gameTest.addLetter('த');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'த', 'ம்']);
      expect(gameTest.currentWord.join(), 'சதம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[1][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[1][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[1][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[1][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      
      //Validating the Board Tile Border Color
      expect(gameTest.board[1][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[1][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[1][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[1][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[1][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[1][0].letter, 'ச');
      expect(gameTest.board[1][1].letter, 'த');
      expect(gameTest.board[1][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      gameTest.addLetter('ச');
      gameTest.addLetter('ர');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ர', 'ம்']);
      expect(gameTest.currentWord.join(), 'சரம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[2][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[2][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[2][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[2][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[2][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[2][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[2][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[2][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[2][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[2][0].letter, 'ச');
      expect(gameTest.board[2][1].letter, 'ர');
      expect(gameTest.board[2][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      gameTest.addLetter('மா');
      gameTest.addLetter('ன');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['மா', 'ன', 'ம்']);
      expect(gameTest.currentWord.join(), 'மானம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[3][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[3][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[3][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[3][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[3][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[3][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[3][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[3][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[3][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[3][0].letter, 'மா');
      expect(gameTest.board[3][1].letter, 'ன');
      expect(gameTest.board[3][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      gameTest.addLetter('த');
      gameTest.addLetter('ன');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['த', 'ன', 'ம்']);
      expect(gameTest.currentWord.join(), 'தனம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[4][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[4][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(gameTest.board[4][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[4][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[4][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(gameTest.board[4][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[4][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[4][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[4][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[4][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[4][0].letter, 'த');
      expect(gameTest.board[4][1].letter, 'ன');
      expect(gameTest.board[4][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ன');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ன', 'ம்']);
      expect(gameTest.currentWord.join(), 'தினம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      gameTest.wordCheck();

      //Validating the Board Tile Background Color
      expect(gameTest.board[5][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(gameTest.board[5][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[5][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(gameTest.board[5][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(gameTest.board[5][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[5][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(gameTest.board[5][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(gameTest.board[5][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(gameTest.board[5][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(gameTest.board[5][0].letter, 'தி');
      expect(gameTest.board[5][1].letter, 'ன');
      expect(gameTest.board[5][2].letter, 'ம்');

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

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);
      //Clean-up - Resetting the Keyboard
      gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[2][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor =
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
          gameTest.keyboard.keyboardMap[gameTest.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
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
          gameTest.keyboard.keyboardMap[gameTest.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
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
          gameTest.keyboard.keyboardMap[gameTest.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });

    test('Word Check Method with Multiple Entry Test - 6th Try has Wrong Word',
        () {
      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
      game.addLetter('ர');
      game.addLetter('த');
      game.addLetter('ம்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ர', 'த', 'ம்']);
      expect(game.currentWord.join(), 'ரதம்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[0][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[0][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(game.board[0][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[0][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[0][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Letter
      expect(game.board[0][0].letter, 'ர');
      expect(game.board[0][1].letter, 'த');
      expect(game.board[0][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Check the Current Word List Has Empty.
      expect(game.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      game.addLetter('ச');
      game.addLetter('ந்');
      game.addLetter('த');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'ந்', 'த']);
      expect(game.currentWord.join(), 'சந்த');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Validating the WordCheck Method Has Return the Value has Not in the WordList
      expect(game.wordCheck(), WordStatus.notInWordList);

      //Validating the Board Tile Background Color
      expect(
          game.board[1][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[1][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(game.board[1][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));
      expect(game.board[1][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.lightGrey));

      //Validating the Board Tile Border Color
      expect(game.board[1][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(game.board[1][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));
      expect(game.board[1][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.lightGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[1][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[1][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[1][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[1][0].letter, 'ச');
      expect(game.board[1][1].letter, 'ந்');
      expect(game.board[1][2].letter, 'த');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();

      //Validating the Clean-up
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('ச');
      game.addLetter('த');
      game.addLetter('ம்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'த', 'ம்']);
      expect(game.currentWord.join(), 'சதம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[1][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[1][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[1][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[1][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[1][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(game.board[1][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[1][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[1][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[1][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[1][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[1][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[1][0].letter, 'ச');
      expect(game.board[1][1].letter, 'த');
      expect(game.board[1][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('ச');
      game.addLetter('ர');
      game.addLetter('ம்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'ர', 'ம்']);
      expect(game.currentWord.join(), 'சரம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[2][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[2][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[2][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[2][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[2][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[2][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(game.board[2][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[2][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[2][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[2][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[2][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[2][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[2][0].letter, 'ச');
      expect(game.board[2][1].letter, 'ர');
      expect(game.board[2][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('மா');
      game.addLetter('ன');
      game.addLetter('ம்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['மா', 'ன', 'ம்']);
      expect(game.currentWord.join(), 'மானம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[3][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[3][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[3][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[3][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[3][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(game.board[3][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(game.board[3][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[3][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(game.board[3][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[3][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[3][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[3][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[3][0].letter, 'மா');
      expect(game.board[3][1].letter, 'ன');
      expect(game.board[3][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));

      //Validating the CurrentWord Has Empty Length.
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('வா');
      game.addLetter('ழ்');
      game.addLetter('க');

      //Validating the CurrentWord List
      expect(game.currentWord, ['வா', 'ழ்', 'க']);
      expect(game.currentWord.join(), 'வாழ்க');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[4][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[4][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[4][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[4][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[4][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[4][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));

      //Validating the Board Tile Border Color
      expect(game.board[4][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[4][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[4][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[4][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[4][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[4][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[4][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[4][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[4][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[4][0].letter, 'வா');
      expect(game.board[4][1].letter, 'ழ்');
      expect(game.board[4][2].letter, 'க');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(game.currentWord, []);

      //We Enter The Correct Secret Word in Second Row using GetLetter Method
      game.addLetter('த');
      game.addLetter('ன');
      game.addLetter('ம்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['த', 'ன', 'ம்']);
      expect(game.currentWord.join(), 'தனம்');

      when(mockWord.getLetters()).thenReturn(['தி', 'ன', 'ம்']);

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(
          game.board[5][0].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[5][1].bgColor, Helper.getTileBGColor(TileBGColor.white));
      expect(
          game.board[5][2].bgColor, Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[5][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[5][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(game.board[5][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));

      //Validating the Board Tile Border Color
      expect(game.board[5][0].borderColor,
          Helper.getTileBorderColor(TileBorderColor.darkGrey));
      expect(game.board[5][1].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));
      expect(game.board[5][2].borderColor,
          Helper.getTileBorderColor(TileBorderColor.green));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[5][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[5][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[5][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Letter
      expect(game.board[5][0].letter, 'த');
      expect(game.board[5][1].letter, 'ன');
      expect(game.board[5][2].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(game.keyboard.keyboardMap[game.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(game.keyboard.keyboardMap[game.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(game.keyboard.keyboardMap[game.board[5][2].letter]!.bgColor,
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
      game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[2][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[2][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[2][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[3][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[3][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[3][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[4][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[4][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[4][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[5][0].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[5][1].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      game.keyboard.keyboardMap[game.board[5][2].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);

      //Validating the Keyboard Reset
      expect(game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[2][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[2][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[2][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[3][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[5][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(game.keyboard.keyboardMap[game.board[5][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
    });
  });
}
