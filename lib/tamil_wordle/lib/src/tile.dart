library tamil_wordle;

//Tile: A class for genarating the tile in the game board.
class Tile {
  String letter;
  String bgColor;
  String letterColor;
  String borderColor;
  bool isFlipped = false;
  String flippedBGColor = 'lightGrey';
  String flippedLetterColor = 'white';

  //Default constructor
  Tile(this.letter, this.bgColor, this.letterColor,
      {this.borderColor = 'lightGrey'});

  //Named constructor
  Tile.withoutLetter(this.bgColor)
      : letter = '',
        letterColor = 'black',
        borderColor = 'grey';
}
