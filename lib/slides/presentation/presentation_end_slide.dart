import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class PresentationEndSlide extends FlutterDeckSlideWidget {
  const PresentationEndSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/PresentationEndSlide',
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
                    'assets/images/presentation-gif.gif',
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
                    'Aplicación finalizada',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Dominio expandido, aplicación implementada\ny UI completa',
                    textAlign: TextAlign.center,
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
                          title: 'Pantallas/Screens',
                          description: 'Scaffold de aquellas vistas que se van a utilizar dentro del router de la aplicación',
                        ),
                        TipWidget(
                          number: 2,
                          title: 'Páginas/Pages',
                          description: 'Agrupación de pantallas que se van a utilizar dentro de pantallas, como tabs o bottom navigation',
                        ),
                        TipWidget(
                          number: 3,
                          title: 'UI/Widgets',
                          description: 'Aquellos widgets que se van a utilizar en las pantallas y páginas de la aplicación, como botones, textos, imágenes, etc.',
                        ),
                        TipWidget(
                          number: 4,
                          title: 'Por Feature',
                          description: 'Organización de los widgets por funcionalidad, para que sean reutilizables y escalables',
                        ),
                        TipWidget(
                          title: 'Con la menor lógica posible',
                          description: 'Según el patrón de diseño, la lógica de la aplicación no debe estar en las pantallas, páginas o widgets, sino en las capas de dominio y aplicación',
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
