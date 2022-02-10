import 'package:flutter/material.dart';
import 'package:gifting_app/filter_algo/filter.dart';
import 'package:gifting_app/filter_algo/mockvalues.dart';
import 'package:gifting_app/home/select_your_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_glow/flutter_glow.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MockValues mockValues;
    return Scaffold(
      body: Container(
        color: Colors.pink[200],
        child: Center(
          child: DottedBorder(
            color: Colors.white,
            strokeCap: StrokeCap.butt,
            strokeWidth: 9,
            borderType: BorderType.Circle,
            dashPattern: const [3, 5],
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              child: InkWell(
                splashColor: Colors.red[100],
                highlightColor: Colors.red[100],
                customBorder: const CircleBorder(side: BorderSide.none),
                onTap: () {
                  Filter().generateMockValues();
                  /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Intro(),
                    ),
                  ); */
                },
                child: Center(
                  child: GlowText(
                    "START",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                    ),
                    glowColor: Colors.yellow[100],
                    blurRadius: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
