import 'package:flutter/material.dart';
import 'package:gifting_app/models/clickables/backbutton.dart';
import 'package:gifting_app/models/listviews/tiled_selectors/budget.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.red[50],
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome to the search algorithm!\n\nUse the next few pages to enter some details about yourself \n\nThen we'll go from there!",
                style: GoogleFonts.alata(fontSize: 20),
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
                        builder: (context) => BudgetList(
                          title: "Select Your Budget!",
                          numberValue: "",
                        ),
                      ));
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.83,
            left: MediaQuery.of(context).size.width * 0.1,
            child: const CustomBackButton(),
          )
        ],
      ),
    );
  }
}
