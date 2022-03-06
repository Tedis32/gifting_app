import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gifting_app/exportable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectedAge extends StatefulWidget {
  const SelectedAge({Key? key, required this.ageValue}) : super(key: key);
  final String ageValue;
  @override
  _SelectedAgeState createState() => _SelectedAgeState();
}

class _SelectedAgeState extends State<SelectedAge> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Center(
        child: Text(
          widget.ageValue,
          style: GoogleFonts.poppins(
            fontSize: 30,
            color: Colors.pink[100]
          ),
        ),
      ),
    );
  }
}
