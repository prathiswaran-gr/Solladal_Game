import 'package:flutter/material.dart';
import './config/colors.dart';
class Helper {
  static Color getColor(String color) {
    Color hexColor = grey;
    switch (color) {
      case 'grey':
        {
          hexColor = grey;
        }
        break;
      case 'black':
        {
          hexColor = black;
        }
        break;
      case 'darkGrey':
        {
          hexColor = darkGrey;
        }
        break;
      case 'yellow':
        {
          hexColor = yellow;
        }
        break;
      case 'white':
        {
          hexColor = white;
        }
        break;
      case 'lightGrey':
        {
          hexColor = lightGrey;
        }
        break;
      case 'lightDarkGrey':
        {
          hexColor = lightDarkGrey;
        }
        break;
      case 'lightYellow':
        {
          hexColor = lightYellow;
        }
        break;
      case 'lightGreen':
        {
          hexColor = lightGreen;
        }
        break;
      case 'lightGreyBorder':
        {
          hexColor = lightGreyBorder;
        }
        break;
      default:
        {
          hexColor = green;
        }
        break;
    }
    return hexColor;
  }
}
