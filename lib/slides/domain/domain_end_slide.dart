
import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class DomainEndSlide extends FlutterDeckSlideWidget {
  const DomainEndSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/domain_end_slide',
            title: 'domain end',
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
                    'assets/images/domain-gif.gif',
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
                    '¿Y entonces qué es el dominio?',
                    style: GoogleFonts.spaceGrotesk().copyWith(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'La capa aislada',
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
                          title: 'Reglas de negocio',
                          description: 'Es la capa que contiene las reglas de negocio y la lógica de la aplicación',
                        ),
                        TipWidget(
                          number: 2,
                          title: 'Es independiente',
                          description: 'En esta capa no se deben tener dependencias de frameworks o librerías externas',
                        ),
                        TipWidget(
                          number: 3,
                          title: 'Sin lógica',
                          description: 'No debe contener lógica de presentación, ni de acceso a datos',
                        ),
                        TipWidget(
                          number: 4,
                          title: 'Fácil de testear',
                          description: 'Permite realizar pruebas unitarias de la lógica de negocio',
                        ),
                        TipWidget(
                          number: 5,
                          title: 'Capa inicial',
                          description: 'La capa de dominio es la primera capa que se debe implementar en un proyecto',
                        ),
                        TipWidget(
                          number: 6,
                          title: 'De adentro hacia afuera',
                          description: 'La capa de dominio es la capa más interna de la arquitectura',
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
