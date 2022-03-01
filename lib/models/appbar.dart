import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.indigo[300],
      iconTheme: const IconThemeData(color: Colors.black),
      title: Center(
        child: Text(
          widget.title,
          style: GoogleFonts.ubuntu(color: Colors.white),
        ),
      ),
    );
  }
}
