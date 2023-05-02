import 'package:tamil_wordle/src/database.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

//Create the Mock Database for database.dart file used to test the database Testing
void main() {
  //'Group of Database Getter Methods Test'
  group('Group of Database Getter Methods Test', () {
    Database database = Database();
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
      ['சந்திரன்', 'https://www.google.co.in', 'https://www.amazon.in/', 'https://www.flipkart.com'],
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
      expect(
          database.keyList, [
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
}
