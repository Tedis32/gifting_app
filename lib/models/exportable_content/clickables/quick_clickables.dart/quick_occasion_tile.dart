import 'package:flutter/material.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuickOccasionTile extends StatefulWidget {
  const QuickOccasionTile(
      {Key? key, required this.occasion, required this.icon})
      : super(key: key);
  final String occasion;
  final Icon icon;
  @override
  _QuickOccasionTileState createState() => _QuickOccasionTileState();
}

class _QuickOccasionTileState extends State<QuickOccasionTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Provider.of<Exportable>(context, listen: false).occasion =
            widget.occasion;
        Provider.of<QuickSearchProvider>(context, listen: false).updateTrue(1);
        Navigator.pop(context);
      },
      child: Container(
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: GridTile(
          child: Center(
            child: Text(
              widget.occasion,
              textAlign: TextAlign.center,
              style: GoogleFonts.alata(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
