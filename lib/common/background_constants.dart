import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'dart:math';

Color generatePastelColor() {
  Random random = Random();
  int r = 128 + random.nextInt(128); // Rango de rojo suave (128-255)
  int g = 128 + random.nextInt(128); // Rango de verde suave (128-255)
  int b = 128 + random.nextInt(128); // Rango de azul suave (128-255)
  return Color.fromRGBO(r, g, b, 1.0);
}

double generateRandomDouble(double min, double max) {
  Random random = Random();
  return min + random.nextDouble() * (max - min);
}

FlutterDeckBackgroundConfiguration generateBackground() {
  Color fistColor = generatePastelColor();
  Color secondColor = generatePastelColor();
  Color thirdColor = generatePastelColor();
  Color fourthColor = generatePastelColor();

  return FlutterDeckBackgroundConfiguration(
    light: FlutterDeckBackground.custom(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffffffff), Color.fromARGB(255, 168, 168, 168)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -150,
              left: 0,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: fistColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: secondColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: -100,
              right: 150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: thirdColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 350,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 155.0,
                    sigmaY: 155.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    dark: FlutterDeckBackground.custom(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff000000), Color.fromARGB(255, 26, 27, 27)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: generateRandomDouble(100, -150),
              left: generateRandomDouble(-100, 100),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: fistColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: generateRandomDouble(100, -150),
              left: generateRandomDouble(-100, 150),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: secondColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: generateRandomDouble(100, -150),
              right: generateRandomDouble(-100, 150),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: thirdColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: generateRandomDouble(100, -150),
              right: generateRandomDouble(-100, 150),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: fourthColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 155.0,
                    sigmaY: 155.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
