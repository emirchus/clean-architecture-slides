import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';

class PresentationLayerSlide extends FlutterDeckSlideWidget {
  const PresentationLayerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/presentation_slide',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      backgroundBuilder: (context) => generateBackground().dark,
      title: "Presentación/Presentation",
      subtitle: "UI, lógica de presentación y manejo de estado.",
    );
  }
}
