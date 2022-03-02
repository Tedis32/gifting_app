import 'package:flutter/material.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/budget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OccasionTile extends StatefulWidget {
  const OccasionTile({Key? key, required this.occasion, required this.icon})
      : super(key: key);
  final String occasion;
  final Icon icon;
  @override
  _OccasionTileState createState() => _OccasionTileState();
}

class _OccasionTileState extends State<OccasionTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Provider.of<Exportable>(context, listen: false).occasion =
            widget.occasion;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BudgetList(
              title: "Enter your budget! (€)",
            ),
          ),
        );
      },
      child: Column(
        children: [
          Center(
            child: Text(
              widget.occasion,
              style: GoogleFonts.alata(
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          widget.icon,
        ],
      ),
    );
  }
}
