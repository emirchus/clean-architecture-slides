import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class CleanArchitectureSlide extends FlutterDeckSlideWidget {
  const CleanArchitectureSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/clean_arch_slide',
            title: 'Clean Architecture',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  maxWidth: width / 2,
                  maxHeight: double.infinity,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/editor.png',
                    scale: 1.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      '¿Qué es Clean Architecture?',
                      style: GoogleFonts.spaceGrotesk().copyWith(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Su propósito de existir',
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
                            title: 'Separación de capas',
                            description: 'Promueve la escalabilidad, la adaptabilidad y la facilidad de mantenimiento',
                          ),
                          TipWidget(
                            number: 2,
                            title: 'Independencia de frameworks',
                            description: 'Permite cambiar de framework sin afectar la lógica de negocio',
                          ),
                          TipWidget(
                            number: 3,
                            title: 'Testabilidad',
                            description: 'Gracias a la separación de capas, es más fácil de testear',
                          ),
                          TipWidget(
                            number: 4,
                            title: 'Inyección de dependencias',
                            description: 'Nos permite desacoplar las dependencias de las clases',
                          ),
                          TipWidget(
                            number: 5,
                            title: 'Principios S.O.L.I.D.',
                            description: 'Single Responsibility Principle, Open/Closed Principle, Liskov Substitution Principle, Interface Segregation Principle, Dependency Inversion Principle',
                          ),
                          TipWidget(
                            number: 6,
                            title: 'Muchos sabores',
                            description: 'Existen muchas implementaciones de Clean Architecture',
                          ),
                          TipWidget(
                            title: 'Tio Bob\'s',
                            description: 'Robert C. Martin, creador de Clean Architecture y Clean Code',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
