// ignore_for_file: unnecessary_type_check

import 'package:tamil_wordle/src/status.dart';
import 'package:test/test.dart';

void main()
{

  //'Game Status Enum Test'
  group('Enum Game Status Test', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Game Status Enum Test', () {
      expect(Status.inProgress is Status, true);
      expect(Status.lose is Status, true);
      expect(Status.win is Status, true);
    });
  });
}