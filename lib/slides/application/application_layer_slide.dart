import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ApplicationLayerSlide extends FlutterDeckSlideWidget {
  const ApplicationLayerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/application_slide',
            title: 'application',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      backgroundBuilder: (context) => generateBackground().dark,
      title: "Aplicación/Application",
      subtitle: "Integrando el framework e implementando el dominio.",
    );
  }
}
