import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterSlide extends FlutterDeckSlideWidget {
  const FlutterSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter_slide',
            title: 'Flutter',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return FlutterDeckSlide.template(
      backgroundBuilder: (context) => generateBackground().dark,
      contentBuilder: (context) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width / 3,
                  maxHeight: double.infinity,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/flutter-meme.jpg',
                    scale: 1.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '¿De dónde salió Flutter?',
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'El framework de Google',
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Expanded(
                    flex: 1,
                    child: Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TipWidget(
                          number: 1,
                          title: 'Rápido desarrollo',
                          description: 'Flutter permite desarrollar aplicaciones de forma rápida',
                        ),
                        TipWidget(
                          number: 2,
                          title: 'Productivo',
                          description: 'Permite desarrollar aplicaciones para Android, iOS, Web y Desktop',
                        ),
                        TipWidget(
                          number: 3,
                          title: 'Para desarrolladores',
                          description: 'Hot Reload, Hot Restart, Build Modes, Flavours, entre otras características que facilitan el desarrollo',
                        ),
                        TipWidget(
                          number: 4,
                          title: 'Flexible',
                          description: 'Permite personalizar la apariencia de la aplicación, TODO es un widget.',
                        ),
                        TipWidget(
                          number: 5,
                          title: 'Comunidad',
                          description: 'Flutter tiene una gran comunidad de desarrolladores, que comparten su conocimiento y crean paquetes para facilitar el desarrollo',
                        ),
                        TipWidget(
                          number: 6,
                          title: 'Open Source',
                          description: 'Flutter es un proyecto de código abierto, lo que permite a la comunidad contribuir al desarrollo del framework',
                        ),
                        TipWidget(
                          title: 'Eric Seidel',
                          description: 'Creador de Flutter <3',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TipWidget extends StatelessWidget {
  final int? number;
  final String title;
  final String? description;
  const TipWidget({super.key, this.number, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          if (number != null)
            Text(
              '$number.',
              style: GoogleFonts.unbounded().copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.spaceGrotesk().copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (description != null)
                SizedBox(
                  width: width / 3,
                  child: Text(
                    description!,
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 18,
                    ),
                    softWrap: true,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
