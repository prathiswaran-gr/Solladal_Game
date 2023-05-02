// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/status.dart';
import 'package:tamil_wordle/src/word_status.dart';
import 'package:test/test.dart';

void main()
{
  //'Game Word Status Enum Test'
  //Status.dart File Test
  group('Enum Game Status Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Game Word Status Enum Test', () {
      expect(WordStatus.success is WordStatus, true);
      expect(WordStatus.notInWordList is WordStatus, true);
      expect(WordStatus.alreadyExist is WordStatus, true);
    });
  });
}