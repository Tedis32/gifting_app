import 'package:flutter/material.dart';
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
      onTap: () {
        try {
          Provider.of<Exportable>(context, listen: false)
              .minAgeDeconstructor(widget.ageValue);
          if (Provider.of<Exportable>(context, listen: false).ageMinimum ==
              70) {
            Provider.of<Exportable>(context, listen: false).ageMaximum = 150;
          } else {
            Provider.of<Exportable>(context, listen: false)
                .maxAgeDeconstructor(widget.ageValue);
          }
        } on Exception catch (_, e) {
          print(e);
        }
      },
      title: Center(
        child: Text(
          widget.ageValue,
          style: GoogleFonts.alata(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
