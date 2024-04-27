import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
            title: 'Clean Architecture con Flutter',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    var background = generateBackground().dark;
    return FlutterDeckSlide.title(
      backgroundBuilder: (context) => background,
      title: "Clean Architecture\ncon Flutter",
      subtitle: "Por donde empezar\nY como escalar",
    );
  }
}
