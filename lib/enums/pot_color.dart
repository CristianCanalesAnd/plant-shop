import 'package:flutter/material.dart';

enum PotColor {
  white,
  ember,
  sand,
  greyCement,
  crestBlue,
  cast,
  black;

  Color get color {
    switch (this) {
      case PotColor.white:
        return const Color(0XFFFFFFFF);
      case PotColor.ember:
        return const Color(0XFF5D6666);
      case PotColor.sand:
        return const Color(0XFFE3D1BC);
      case PotColor.greyCement:
        return const Color(0XFF9D9D9D);
      case PotColor.crestBlue:
        return const Color(0XFF656C7B);
      case PotColor.cast:
        return const Color(0XFFE3AC5E);
      case PotColor.black:
        return const Color(0XFF111111);
    }
  }
}
