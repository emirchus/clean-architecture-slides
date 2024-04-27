import 'package:flutter/material.dart';
import 'package:flutter_clean/slides/aboutme/about_me_slide.dart';
import 'package:flutter_clean/slides/application/application_end_slide.dart';
import 'package:flutter_clean/slides/application/application_file_slide.dart';
import 'package:flutter_clean/slides/application/application_layer_slide.dart';
import 'package:flutter_clean/slides/clean_arch_slide.dart';
import 'package:flutter_clean/slides/domain/domain_end_slide.dart';
import 'package:flutter_clean/slides/domain/domain_info_slide.dart';
import 'package:flutter_clean/slides/domain/domain_layer_slide.dart';
import 'package:flutter_clean/slides/end_slide.dart';
import 'package:flutter_clean/slides/flutter_slide.dart';
import 'package:flutter_clean/slides/intro_slide.dart';
import 'package:flutter_clean/slides/presentation/presentation_end_slide.dart';
import 'package:flutter_clean/slides/presentation/presentation_file_slide.dart';
import 'package:flutter_clean/slides/presentation/presentation_layer_slide.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: FlutterDeckConfiguration(
        footer: const FlutterDeckFooterConfiguration(showFooter: false),

        header: const FlutterDeckHeaderConfiguration(
          showHeader: false,
        ),
        // Show progress indicator with specifc gradient and background color.
        progressIndicator: const FlutterDeckProgressIndicator.gradient(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.blueAccent],
          ),
          backgroundColor: Colors.black,
        ),
        // Use a custom slide size.
        slideSize: FlutterDeckSlideSize.fromAspectRatio(
          aspectRatio: const FlutterDeckAspectRatio.ratio16x9(),
          resolution: const FlutterDeckResolution.fhd(),
        ),
        // Use a custom transition between slides.
        transition: const FlutterDeckTransition.rotation(),
      ),
      darkTheme: FlutterDeckThemeData.fromThemeAndText(
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF16222A),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        FlutterDeckTextTheme(
          title: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
          subtitle: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 60,
            fontWeight: FontWeight.w400,
          ),
          header: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 60,
            fontWeight: FontWeight.w400,
          ),
          display: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 60,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 38,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: GoogleFonts.spaceGrotesk().copyWith(
            fontSize: 42,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      lightTheme: FlutterDeckThemeData.fromTheme(
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffF5F5F5),
            brightness: Brightness.light,
          ),
          textTheme: GoogleFonts.spaceGroteskTextTheme(),
          useMaterial3: true,
        ),
      ),
      slides: const [
        IntroSlide(),
        AboutMeSlide(),
        FlutterSlide(),
        CleanArchitectureSlide(),
        DomainLayerSlide(),
        DomainInfoSlide(),
        DomainEndSlide(),
        ApplicationLayerSlide(),
        AppliationFileSlide(), //Sí ya sé e.e
        ApplicationEndSlide(),
        PresentationLayerSlide(),
        PresentantionFileSlide(),
        PresentationEndSlide(),
        EndSlide(),
      ],
    );
  }
}
