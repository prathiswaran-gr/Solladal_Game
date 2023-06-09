// Mocks generated by Mockito 5.1.0 from annotations
// in tamil_wordle/test/UnitTest/game_test.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:tamil_wordle/src/allowed_words.dart' as _i2;
import 'package:tamil_wordle/src/key.dart' as _i4;
import 'package:tamil_wordle/src/keyboard.dart' as _i3;
import 'package:tamil_wordle/src/word.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeAllowedWords_0 extends _i1.Fake implements _i2.AllowedWords {}

/// A class which mocks [Keyboard].
///
/// See the documentation for Mockito's code generation for more information.
class MockKeyboard extends _i1.Mock implements _i3.Keyboard {
  MockKeyboard() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<String, _i4.Key> get keyboardMap =>
      (super.noSuchMethod(Invocation.getter(#keyboardMap),
          returnValue: <String, _i4.Key>{}) as Map<String, _i4.Key>);
  @override
  set keyboardMap(Map<String, _i4.Key>? _keyboardMap) =>
      super.noSuchMethod(Invocation.setter(#keyboardMap, _keyboardMap),
          returnValueForMissingStub: null);
  @override
  bool get isEnabled =>
      (super.noSuchMethod(Invocation.getter(#isEnabled), returnValue: false)
          as bool);
  @override
  set isEnabled(bool? _isEnabled) =>
      super.noSuchMethod(Invocation.setter(#isEnabled, _isEnabled),
          returnValueForMissingStub: null);
}

/// A class which mocks [Word].
///
/// See the documentation for Mockito's code generation for more information.
class MockWord extends _i1.Mock implements _i5.Word {
  MockWord() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AllowedWords get allowedWords =>
      (super.noSuchMethod(Invocation.getter(#allowedWords),
          returnValue: _FakeAllowedWords_0()) as _i2.AllowedWords);
  @override
  set allowedWords(_i2.AllowedWords? _allowedWords) =>
      super.noSuchMethod(Invocation.setter(#allowedWords, _allowedWords),
          returnValueForMissingStub: null);
  @override
  String get secretWord =>
      (super.noSuchMethod(Invocation.getter(#secretWord), returnValue: '')
          as String);
  @override
  Map<String, _i2.AllowedWords> get wordList =>
      (super.noSuchMethod(Invocation.getter(#wordList),
              returnValue: <String, _i2.AllowedWords>{})
          as Map<String, _i2.AllowedWords>);
  @override
  List<String> get keyList =>
      (super.noSuchMethod(Invocation.getter(#keyList), returnValue: <String>[])
          as List<String>);
  @override
  List<String> getLetters() =>
      (super.noSuchMethod(Invocation.method(#getLetters, []),
          returnValue: <String>[]) as List<String>);
  @override
  int validateKaSequence(int? letter, String? word) => (super.noSuchMethod(
      Invocation.method(#validateKaSequence, [letter, word]),
      returnValue: 0) as int);
}
