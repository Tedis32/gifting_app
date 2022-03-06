import 'package:flutter/material.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/clickables/occasion_tile.dart';
import 'package:gifting_app/models/exportable_content/clickables/quick_clickables.dart/quick_occasion_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuickOccasion extends StatefulWidget {
  const QuickOccasion({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _QuickOccasionState createState() => _QuickOccasionState();
}

class _QuickOccasionState extends State<QuickOccasion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.13,
                    right: MediaQuery.of(context).size.width * 0.13,
                  ),
                  children: const [
                    QuickOccasionTile(
                      occasion: "Birthday",
                      icon: Icon(
                        Icons.celebration,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Christmas",
                      icon: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Wedding",
                      icon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Baby shower",
                      icon: Icon(
                        Icons.bathtub,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Graduation",
                      icon: Icon(
                        Icons.query_builder,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Valentine's day",
                      icon: Icon(
                        EvaIcons.heart,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Mother's day",
                      icon: Icon(
                        MdiIcons.humanFemale,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Father's day",
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    QuickOccasionTile(
                      occasion: "Other",
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
