import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean/common/background_constants.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class EndSlide extends FlutterDeckSlideWidget {
  const EndSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/EndSlide',
            title: 'EndSlide',
            transition: FlutterDeckTransition.fade(),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.template(backgroundBuilder: (context) => generateBackground().dark, contentBuilder: (context) => const EndScreen());
  }
}

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> with SingleTickerProviderStateMixin {
  late final ConfettiController _controller = ConfettiController(duration: const Duration(seconds: 10));

  @override
  void initState() {
    _controller.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height / 2,
                    maxHeight: double.infinity,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/aplausos.gif',
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
                      '¡Gracias por asistir!',
                      style: GoogleFonts.spaceGrotesk().copyWith(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.code),
                            const SizedBox(width: 10),
                            Text(
                              '/Emirchus',
                              style: GoogleFonts.spaceGrotesk().copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Text(
                              '𝕏',
                              style: GoogleFonts.spaceGrotesk().copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '@Emirchus',
                              style: GoogleFonts.spaceGrotesk().copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
              shouldLoop: true, // start again as soon as the animation is finished
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
              shouldLoop: true, // start again as soon as the animation is finished
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple], // manually specify the colors to be used
              // createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
        ],
      ),
    );
  }
}
