import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickSelectedAge extends StatefulWidget {
  const QuickSelectedAge({Key? key, required this.ageValue}) : super(key: key);
  final String ageValue;
  @override
  _QuickSelectedAgeState createState() => _QuickSelectedAgeState();
}

class _QuickSelectedAgeState extends State<QuickSelectedAge> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Center(
        child: Text(
          widget.ageValue,
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.black),
        ),
      ),
    );
  }
}
