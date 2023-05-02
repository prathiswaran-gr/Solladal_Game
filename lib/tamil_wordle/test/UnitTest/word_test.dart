import 'package:mockito/mockito.dart';
import 'package:tamil_wordle/src/allowed_words.dart';
import 'package:tamil_wordle/src/database.dart';
import 'package:tamil_wordle/src/word.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'word_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.

//Create the Mock Database for database.dart file used to test the Word Class Testing
@GenerateMocks([Database])
void main() {
  group('A group of Word Class Test', () {
    //MockDatabase Object creation
    final MockDatabase mockDatabase = MockDatabase();
    when(mockDatabase.secretWord).thenReturn('கதிரவன');
    when(mockDatabase.wordList).thenReturn([
      ['திருமணம்', null, null, null],
      ['சந்திரன்', 'https://www.google.co.in', 'https://www.amazon.in/', 'https://www.flipkart.com'],
      ['கதிரவன', null, null, null],
      ['மயக்கம்', null, null, null],
      ['தயக்கம்', null, null, null],
      ['திரவியம்', null, null, null],
      ['கடிகாரம்', null, null, null],
      ['திருமணம', null, null, null]
    ]);
    when(mockDatabase.keyList)
        .thenReturn(['ம்', 'க்', 'ன', 'ச', 'ந்', 'தி', 'ர', 'ன்']);

    //Word Class Object Creation
    final Word word = Word(mockDatabase);

    setUp(() {
      // Additional setup goes here.
    });

    //Secret Word Getter Method Test
    test('Get Secret Word Test', () {
      expect(word.secretWord, 'கதிரவன');
    });

    //Word List Getter Method Test
    test('Get Word List Without Audio, Video, Image Test', () {
      var expectedWordList = {
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'சந்திரன்': AllowedWords.wordonly('சந்திரன்'),
        'கதிரவன': AllowedWords.wordonly('கதிரவன'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'திருமணம': AllowedWords.wordonly('திருமணம')
      };

      expect(word.wordList.length, expectedWordList.length);
      expect(word.wordList['திருமணம']!.word, expectedWordList['திருமணம']!.word);

      expect(word.wordList['திருமணம']!.audio == null, true);
      expect(word.wordList['திருமணம']!.image  == null, true);
      expect(word.wordList['திருமணம']!.video == null, true);

    });

    test('Get Word List With Audio, Video, Image Test', () {
      var expectedWordList = {
        'திருமணம்': AllowedWords.wordonly('திருமணம்'),
        'சந்திரன்': AllowedWords('சந்திரன்', Uri.parse('https://www.google.co.in'),  Uri.parse('https://www.amazon.in/'), Uri.parse('https://www.flipkart.com')),
        'கதிரவன': AllowedWords.wordonly('கதிரவன'),
        'மயக்கம்': AllowedWords.wordonly('மயக்கம்'),
        'தயக்கம்': AllowedWords.wordonly('தயக்கம்'),
        'திரவியம்': AllowedWords.wordonly('திரவியம்'),
        'கடிகாரம்': AllowedWords.wordonly('கடிகாரம்'),
        'திருமணம': AllowedWords.wordonly('திருமணம')
      };

      expect(word.wordList.length, expectedWordList.length);
      expect(word.wordList['சந்திரன்']!.word, expectedWordList['சந்திரன்']!.word);

      expect(word.wordList['சந்திரன்']!.audio!.data ,  Uri.parse('https://www.google.co.in').data);
      expect(word.wordList['சந்திரன்']!.image!.data , Uri.parse('https://www.amazon.in/').data);
      expect(word.wordList['சந்திரன்']!.video!.data , Uri.parse('https://www.flipkart.com').data);

    });

    //Key List Getter Method Test
    test('Get Key List Test', () {
      expect(word.keyList, ['ம்', 'க்', 'ன', 'ச', 'ந்', 'தி', 'ர', 'ன்']);
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
      expect(word.getLetters(), ['க', 'தி', 'ர', 'வ', 'ன']);
    });

    //GetLetter Method Returs The List Length has 5 -Test
    test('getLetter Method Return Value length Test', () {
      expect((word.getLetters()).length, 5);
    });
  });
}
