import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';

class DomainLayerSlide extends FlutterDeckSlideWidget {
  const DomainLayerSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/domain_slide',
            title: 'domain',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      backgroundBuilder: (context) => generateBackground().dark,
      title: "Dominio/Domain/Core",
      subtitle: "Abstrayendo la lógica de negocio.",
    );
  }
}
