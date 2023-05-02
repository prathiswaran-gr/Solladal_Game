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
  group('Game Code for WordCheck Failure Condition Test', () {
    //MockWord Object Creation
    MockWord mockWord = MockWord();

    //Initialize the Rows and Column Values for Game Constructor Access
    final int rows = 6;
    final int columns = 5;

    //MockKeyboard Object Creation
    MockKeyboard mockKeyboard = MockKeyboard();
    //Create Stubs for Word Object
    when(mockWord.secretWord).thenReturn('திருமணம');
    when(mockWord.wordList).thenReturn({
      'திருமணம்': AllowedWords.wordonly('திருமணம்'),
      'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
      'கதிரவன': AllowedWords.wordonly('கதிரவன'),
      'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
      'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
      'திரவியம்': AllowedWords.wordonly('திரவியம்'),
      'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
      'திருமணம': AllowedWords.wordonly('திருமணம'),
      'மருமகன்': AllowedWords.wordonly('மருமகன்')
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
    when(mockWord.getLetters()).thenReturn(['தி','ரு','ம','ண','ம']);

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

      when(mockWord.secretWord).thenReturn('திருமணம');
      when(mockWord.wordList).thenReturn({
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
        'கதிரவன': AllowedWords.wordonly('கதிரவன'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'திருமணம': AllowedWords.wordonly('திருமணம'),
        'மருமகன்': AllowedWords.wordonly('மருமகன்')
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
      when(mockWord.getLetters()).thenReturn(['தி','ரு','ம','ண','ம']);

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

    //We Enter Word in the Board Tile and Check the Word is Correct at First Row  via AddLetter Method- our Entering the word is present in the WordList
    test('WordCheck Operation Checking Test', (() {
      game.addLetter('ம');
      game.addLetter('ரு');
      game.addLetter('ம');
      game.addLetter('க');
      game.addLetter('ன்');

      //Validating the CurrentWord List
      expect(game.currentWord, ['ம','ரு','ம','க','ன்']);
      expect(game.currentWord.join(), 'மருமகன்');

      //Call the WordCheck Method For Validate the Word Has Correct Answer
      game.wordCheck();

      //Validating the Board Tile Background Color
      expect(game.board[0][0].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][1].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][2].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][3].bgColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][4].bgColor,
          Helper.getTileBGColor(TileBGColor.white));

      //Validating the Board Tile Flipped Background Color
      expect(game.board[0][0].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.yellow));
      expect(game.board[0][1].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(game.board[0][2].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.green));
      expect(game.board[0][3].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));
      expect(game.board[0][4].flippedBGColor,
          Helper.getTileBGColor(TileBGColor.darkGrey));

      //Validating the Board Tile Flipped Letter Color
      expect(game.board[0][0].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][1].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][2].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][3].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));
      expect(game.board[0][4].flippedLetterColor,
          Helper.getTileBGColor(TileBGColor.white));


      //Validating the Board Letter
      expect(game.board[0][0].letter, 'ம');
      expect(game.board[0][1].letter, 'ரு');
      expect(game.board[0][2].letter, 'ம');
      expect(game.board[0][3].letter, 'க');
      expect(game.board[0][4].letter, 'ன்');

      //Validating the Keyboard Key Background Color
      expect(
          game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.green));
      expect(
          game.keyboard.keyboardMap[game.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));
      expect(
          game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.darkGrey));

      //Check the Current Word List Has Empty.
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
      
      //Validating the Keyboard Reset
      expect(
          game.keyboard.keyboardMap[game.board[0][0].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          game.keyboard.keyboardMap[game.board[0][1].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          game.keyboard.keyboardMap[game.board[0][2].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          game.keyboard.keyboardMap[game.board[0][3].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));
      expect(
          game.keyboard.keyboardMap[game.board[0][4].letter]!.bgColor,
          Helper.getKeyboardKeyBGColor(keyboardKeyBGColor.grey));


    }));
  });
}
