import 'package:flutter/material.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/listviews/agepicker.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/occasion.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTheirDetails extends StatelessWidget {
  const SelectTheirDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Going well so far!\n\nNow, all we need is some information about the person who you are trying to gift for!\n\nUse the following screens to enter some info about them!",
                style: GoogleFonts.alata(fontSize: 20, color: Colors.pink[50]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.83,
            right: MediaQuery.of(context).size.width * 0.1,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                color: Colors.white,
                splashRadius: 10,
                iconSize: 40,
                icon: const Icon(Icons.arrow_forward_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgePicker(
                        title: "What is their age?",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
                top: MediaQuery.of(context).size.height * 0.83,
                left: MediaQuery.of(context).size.height * 0.05,
                child: const CustomBackButton(),
              ),
        ],
      ),
    );
  }
}
