library tamil_wordle;

class AllowedWords {
  late final String _word;
  late final Uri? _audio;
  late final Uri? _image;
  late final Uri? _video;

  AllowedWords(this._word, this._audio, this._image, this._video);
  AllowedWords.wordonly(this._word)
      : _audio = null,
        _image = null,
        _video = null;

  String get word {
    return _word;
  }

  Uri? get audio {
    return _audio;
  }

  Uri? get image {
    return _image;
  }

  Uri? get video {
    return _video;
  }
}
