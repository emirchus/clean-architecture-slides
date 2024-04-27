import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_clean/common/code_theme.dart';
import 'package:flutter_clean/slides/domain/constants/code_higlight.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlighting/languages/dart.dart';

var bg = generateBackground().dark;

class DomainInfoSlide extends FlutterDeckSlideWidget {
  const DomainInfoSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/domain_info_slide',
            title: 'domain info',
            steps: 5,
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      backgroundBuilder: (context) => bg,
      leftBuilder: (context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Conceptos de dominio',
                style: GoogleFonts.spaceGrotesk().copyWith(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: height * 0.6,
                child: FlutterDeckBulletList(
                  useSteps: true,
                  items: const [
                    'Abstracciones',
                    'Dto (Data Transfer Object)',
                    'Repositorios',
                    'Enums',
                    'Entidades',
                  ],
                ),
              ),
            ],
          ),
        );
      },
      rightBuilder: (context) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(18.0),
          alignment: Alignment.center,
          child: FlutterDeckSlideStepsBuilder(
            builder: (context, stepNumber) => SizedBox(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: HighlightView(
                    kAbstractionCodes[stepNumber - 1],
                    languageId: dart.id,
                    theme: kCodeTheme,
                    padding: const EdgeInsets.all(28),
                    textStyle: GoogleFonts.sourceCodePro().copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
