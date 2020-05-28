import 'dart:math';

import 'package:flutter/material.dart';
import '../styleguides/colors.dart';

class GenerateGradient {

  List<List<Color>> _myColors = [
    firstColorGrad,
    secondColorGrad,
    thirdColorGrad,
    forthColorGrad,
    fifthColorGrad,
    sixthColorGrad,
    seventhColorGrad,
    eighthColorGrad,
    ninthColorGrad,
    tenthColorGrad,
    eleventhColorGrad
  ];

  LinearGradient generate() {
    final _random = Random();
    final grad = _myColors[_random.nextInt(_myColors.length)];
    print(grad);
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0),
      colors: [grad[0], grad[1]],
      tileMode: TileMode.clamp,
    );
  }

}