import 'package:flutter/material.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/budget.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../exportable.dart';

class GiftSearch extends StatefulWidget {
  const GiftSearch({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _GiftSearchState createState() => _GiftSearchState();
}

class _GiftSearchState extends State<GiftSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          //Background image edit
          image: DecorationImage(
            image: AssetImage('assets/images/background_3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Criteria(
              context,
              "Budget",
            ),
          ],
        ),
      ),
    );
  }
}

Widget Criteria(BuildContext context, String criteria) {
  return Consumer<Exportable>(
    builder: (context, exportable, _) {
      return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Card(
          color: Colors.black,
          child: ListTile(
            leading: Text(
              "Select $criteria",
              style: GoogleFonts.alata(fontSize: 25, color: Colors.white),
            ),
            trailing: exportable.budget == 0
                ? const Icon(
                    Icons.indeterminate_check_box_rounded,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.check_box_outlined,
                    color: Colors.green,
                    size: 30,
                  ),
            onTap: () {
              print(exportable.budget);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BudgetList(
                    title: "Enter your budget",
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
