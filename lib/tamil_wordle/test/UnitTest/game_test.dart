import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tamil_wordle/src/key.dart';
import 'package:tamil_wordle/tamil_wordle.dart';
import 'package:tamil_wordle/src/allowed_words.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'game_test.mocks.dart';

//Create the Mock Word for word.dart file used to test the Game Class Testing
//Create the Mock Keyboard for keyboard.dart file used to test the Game Class Testing
@GenerateMocks([Keyboard])
@GenerateMocks([Word])
void main() {
  group('Game Code Test', () {
    //MockWord Object Creation
    MockWord mockWord = MockWord();

    //Initialize the Rows and Column Values for Game Constructor Access
    final int rows = 6;
    final int columns = 5;

    //MockKeyboard Object Creation
    MockKeyboard mockKeyboard = MockKeyboard();
    //Create Stubs for Word Object
    when(mockWord.secretWord).thenReturn('கதிரவன');
    when(mockWord.wordList).thenReturn({
      'திருமணம்': AllowedWords.wordonly('திருமணம்'),
      'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
      'கதிரவன': AllowedWords.wordonly('கதிரவன'),
      'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
      'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
      'திரவியம்': AllowedWords.wordonly('திரவியம்'),
      'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
      'திருமணம': AllowedWords.wordonly('திருமணம')
    });
    when(mockWord.keyList).thenReturn([
      'ம்',
      'க்',
      'ன',
      'ச',
      'ந்',
      'தி',
      'ர',
      'ரு',
      'ன்',
      'த',
      'மா',
      'க',
      'ம',
      'ய',
      'வி',
      'டி',
      'கா',
      'ண',
      'வ'
    ]);
    when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
      'ரு': Key('ரு', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ன்': Key('ன்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'த': Key('த', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'மா': Key('மா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'க': Key('க', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ம': Key('ம', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ய': Key('ய', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'வி': Key('வி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'டி': Key('டி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'கா': Key('கா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'ண': Key('ண', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
      'வ': Key('வ', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
          Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
    });
    Game game = Game(rows, columns, mockKeyboard, mockWord);

    setUp(() {
      mockWord = MockWord();
      mockKeyboard = MockKeyboard();

      when(mockWord.secretWord).thenReturn('கதிரவன');
      when(mockWord.wordList).thenReturn({
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
        'கதிரவன': AllowedWords.wordonly('கதிரவன'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'திருமணம': AllowedWords.wordonly('திருமணம')
      });
      when(mockWord.keyList).thenReturn([
        'ம்',
        'க்',
        'ன',
        'ச',
        'ந்',
        'தி',
        'ர',
        'ரு',
        'ன்',
        'த',
        'மா',
        'க',
        'ம',
        'ய',
        'வி',
        'டி',
        'கா',
        'ண',
        'வ'
      ]);
      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
        'ரு': Key('ரு', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ன்': Key('ன்', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'த': Key('த', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'மா': Key('மா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'க': Key('க', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ம': Key('ம', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ய': Key('ய', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'வி': Key('வி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'டி': Key('டி', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'கா': Key('கா', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'ண': Key('ண', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
            Helper.getKeyboardKeyFGColor(keyboardKeyFGColor.black)),
        'வ': Key('வ', Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey),
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
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('ன்');

      //Validate the CurrentWord List
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

      //Validating the Board Tile Letter
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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord List has Empty.
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
    });

    test('Word Check Method Reurns Word Not in the WordList Value Test', () {
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is not present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('த');
      gameTest.addLetter('மா');
      gameTest.addLetter('மா');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த', 'மா', 'மா']);
      expect(gameTest.currentWord.join(), 'சந்தமாமா');

      //Validating the WordCheck Method Has Return the Value has Word Not in the List
      expect(gameTest.wordCheck(), WordStatus.notInWordList);

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

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'ச');
      expect(gameTest.board[0][1].letter, 'ந்');
      expect(gameTest.board[0][2].letter, 'த');
      expect(gameTest.board[0][3].letter, 'மா');
      expect(gameTest.board[0][4].letter, 'மா');

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
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
      expect(gameTest.currentWord, []);
    });

    test('Word Check Method Returns Word is Already Exists Test', () {
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('ன்');

      //Validate the CurrentWord List
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

      //Validating the Board Tile Letter
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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord List has Empty.
      expect(gameTest.currentWord, []);

      //Enter the Already Exist Word via GetLetter Method
      gameTest.addLetter('ச');
      gameTest.addLetter('ந்');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('ன்');

      //Validate the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'தி', 'ர', 'ன்']);
      expect(gameTest.currentWord.join(), 'சந்திரன்');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

      //Validating the WordCheck Method Has Return the Value has Word is Already Exists
      expect(gameTest.wordCheck(), WordStatus.alreadyExist);

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
      expect(gameTest.board[1][2].letter, 'தி');
      expect(gameTest.board[1][3].letter, 'ர');
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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Clean-up the Current word List and Board Tile Letter via RemoveLetter Method
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();
      gameTest.removeLetter();

      //Validating the Clean-up
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
    });

    test('Word Check Method with Correct Input Test', () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      gameTest.addLetter('க');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('வ');
      gameTest.addLetter('ன');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['க', 'தி', 'ர', 'வ', 'ன']);
      expect(gameTest.currentWord.join(), 'கதிரவன');

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

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'க');
      expect(gameTest.board[0][1].letter, 'தி');
      expect(gameTest.board[0][2].letter, 'ர');
      expect(gameTest.board[0][3].letter, 'வ');
      expect(gameTest.board[0][4].letter, 'ன');

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
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
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
      gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor =
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
    });

    test('Disable Keyboard Method Test', () {
      //Word Check Method Test for Correct Input.
      //gameTest New Object is Created For This Particular Block Test
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

      //We Enter Word in the Board Tile and Check the Word is Correct at First Row - our Entering the word is present in the WordList
      //We Enter The Correct Secret Word in Fourth Row using GetLetter Method
      gameTest.addLetter('க');
      gameTest.addLetter('டி');
      gameTest.addLetter('கா');
      gameTest.addLetter('ர');
      gameTest.addLetter('ம்');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['க', 'டி', 'கா', 'ர', 'ம்']);
      expect(gameTest.currentWord.join(), 'கடிகாரம்');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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

      //Validating the Board Tile Letter
      expect(gameTest.board[0][0].letter, 'க');
      expect(gameTest.board[0][1].letter, 'டி');
      expect(gameTest.board[0][2].letter, 'கா');
      expect(gameTest.board[0][3].letter, 'ர');
      expect(gameTest.board[0][4].letter, 'ம்');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Fifth Row using GetLetter Method
      gameTest.addLetter('தி');
      gameTest.addLetter('ரு');
      gameTest.addLetter('ம');
      gameTest.addLetter('ண');
      gameTest.addLetter('ம்');
      gameTest.addLetter('தி');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம்']);
      expect(gameTest.currentWord.join(), 'திருமணம்');

      //Disable Keyboard Key BG Color Test

      expect(gameTest.keyboard.keyboardMap['க']!.bgColor, 'lightGreen');
      expect(gameTest.keyboard.keyboardMap['டி']!.bgColor, 'lightDarkGrey');
      expect(gameTest.keyboard.keyboardMap['கா']!.bgColor, 'lightDarkGrey');
      expect(gameTest.keyboard.keyboardMap['ர']!.bgColor, 'lightYellow');
      expect(gameTest.keyboard.keyboardMap['ம்']!.bgColor, 'lightDarkGrey');
      expect(gameTest.keyboard.keyboardMap['தி']!.bgColor, 'lightGrey');

      //Clean-up the Board Tile Current Row
      gameTest.removeLetter();
      gameTest.removeLetter();
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
      gameTest.keyboard.keyboardMap[gameTest.board[0][3].letter]!.bgColor =
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey);
      gameTest.keyboard.keyboardMap[gameTest.board[0][4].letter]!.bgColor =
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
    });

    test('Word Check Method with Multiple Entry Test', () {
      //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
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

      //Validating the Board Letter
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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Check the Current Word List Has Empty.
      expect(game.currentWord, []);

      //If complete the First Row Board Has Valid Value and If I add The New Letter in AddLetter Method then Check it's Automatically goes to the Second Row
      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is not present in the WordList
      game.addLetter('ச');
      game.addLetter('ந்');
      game.addLetter('த');
      game.addLetter('மா');
      game.addLetter('மா');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ச', 'ந்', 'த', 'மா', 'மா']);
      expect(game.currentWord.join(), 'சந்தமாமா');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

      //Validating the WordCheck Method Has Return the Value has Word Not in List
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
      expect(game.board[1][3].letter, 'மா');
      expect(game.board[1][4].letter, 'மா');

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

      //Clean-up the Current word List and Board Tile Letter using RemoveLetter Method
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();
      game.removeLetter();

      //Validating the Clean-up
      expect(game.currentWord, []);

      //We Enter Word in the Board Tile and Check the Word is Correct at Second Row - our Entering the word is present in the WordList
      game.addLetter('க');
      game.addLetter('தி');
      game.addLetter('ர');
      game.addLetter('வ');
      game.addLetter('ன');

      //Validating the CurrentWord List
      expect(game.currentWord, ['க', 'தி', 'ர', 'வ', 'ன']);
      expect(game.currentWord.join(), 'கதிரவன');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
      expect(game.board[1][0].letter, 'க');
      expect(game.board[1][1].letter, 'தி');
      expect(game.board[1][2].letter, 'ர');
      expect(game.board[1][3].letter, 'வ');
      expect(game.board[1][4].letter, 'ன');

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
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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
      gameTest.addLetter('மா');
      gameTest.addLetter('மா');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த', 'மா', 'மா']);
      expect(gameTest.currentWord.join(), 'சந்தமாமா');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

      //Validating the WordCheck Method Has Return the Value has Word Not in List
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
      expect(gameTest.board[1][3].letter, 'மா');
      expect(gameTest.board[1][4].letter, 'மா');

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Validating the CurrentWord Has Empty Length.
      expect(gameTest.currentWord, []);

      //We Enter The Correct Secret Word in Sixth(Last Chance) Row using GetLetter Method
      gameTest.addLetter('க');
      gameTest.addLetter('தி');
      gameTest.addLetter('ர');
      gameTest.addLetter('வ');
      gameTest.addLetter('ன');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['க', 'தி', 'ர', 'வ', 'ன']);
      expect(gameTest.currentWord.join(), 'கதிரவன');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
      expect(gameTest.board[5][0].letter, 'க');
      expect(gameTest.board[5][1].letter, 'தி');
      expect(gameTest.board[5][2].letter, 'ர');
      expect(gameTest.board[5][3].letter, 'வ');
      expect(gameTest.board[5][4].letter, 'ன');

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
      Game gameTest = Game(rows, columns, mockKeyboard, mockWord);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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
      gameTest.addLetter('மா');
      gameTest.addLetter('மா');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['ச', 'ந்', 'த', 'மா', 'மா']);
      expect(gameTest.currentWord.join(), 'சந்தமாமா');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

      //Validating the WordCheck Method Has Return the Value has Word Not in WordList
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
      expect(gameTest.board[1][3].letter, 'மா');
      expect(gameTest.board[1][4].letter, 'மா');

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));

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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[1][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[3][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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
      gameTest.addLetter('ம');

      //Validating the CurrentWord List
      expect(gameTest.currentWord, ['தி', 'ரு', 'ம', 'ண', 'ம']);
      expect(gameTest.currentWord.join(), 'திருமணம');

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
      expect(gameTest.board[4][4].letter, 'ம');

      //Validating the Keyboard Key Background Color
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[4][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
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

      when(mockWord.getLetters()).thenReturn(['க', 'தி', 'ர', 'வ', 'ன']);

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
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
      expect(
          gameTest.keyboard.keyboardMap[gameTest.board[5][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.yellow));
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
