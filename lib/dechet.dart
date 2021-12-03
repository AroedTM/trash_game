import 'package:flutter/material.dart';
import 'dart:math';

class Dechet extends StatelessWidget {
  const Dechet();

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(7); // from 0 upto 6 included
    String nbr = randomNumber.toString();
    return Image(
      image: AssetImage("image/" + nbr + ".png"),
    );
  }
}
