
import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationEndSlide extends FlutterDeckSlideWidget {
  const ApplicationEndSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/application_end_slide',
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
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/application-gif.gif',
                    scale: .5,
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
                    'Conclusión de\nla capa de aplicación',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Dominio expandido, aplicación completa',
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
                          title: 'Flujo',
                          description: 'La capa de aplicación es la encargada de orquestar el flujo de datos',
                        ),
                        TipWidget(
                          number: 2,
                          title: 'Interfaz',
                          description: 'La capa de aplicación es la encargada de la interfaz de usuario',
                        ),
                        TipWidget(
                          number: 3,
                          title: 'Unión',
                          description: 'La capa de aplicación es la encargada de unir el dominio con la interfaz de usuario',
                        ),
                        TipWidget(
                          number: 4,
                          title: 'Flutter',
                          description: 'Application es nuestro Wrapper con Flutter',
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
