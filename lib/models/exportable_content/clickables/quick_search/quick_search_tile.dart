import 'package:flutter/material.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/budget.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../exportable.dart';

// ignore: must_be_immutable
class Criteria extends StatefulWidget {
  Criteria(
      {Key? key,
      required this.title,
      required this.selected,
      required this.index})
      : super(key: key);
  final String title;
  // the index is just for the index of the quick_search_provider.dart/searchCriteriaVals access
  bool selected;
  int index;

  @override
  State<Criteria> createState() => _CriteriaState();
}

class _CriteriaState extends State<Criteria> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Card(
        shape: const StadiumBorder(side: BorderSide(width: 0.5)),
        color: Colors.white,
        child: ListTile(
          leading: Text(
            widget.title,
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          ),
          trailing: widget.selected == false
              ? const Icon(
                  Icons.indeterminate_check_box_rounded,
                  color: Colors.black,
                  size: 30,
                )
              : const Icon(
                  Icons.check_box_outlined,
                  color: Colors.green,
                  size: 30,
                ),
          onTap: () {
            Widget route =
                Provider.of<QuickSearchProvider>(context, listen: false)
                    .searchTileWidgets[widget.index];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => route
              ),
            );
          },
        ),
      ),
    );
  }
}
