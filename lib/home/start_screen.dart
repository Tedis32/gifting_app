import 'package:flutter/material.dart';
import 'package:gifting_app/home/intro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DottedBorder(
          color: Colors.deepPurple,
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Intro(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "START",
                  style:
                      GoogleFonts.poppins(color: Colors.indigo, fontSize: 50, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
