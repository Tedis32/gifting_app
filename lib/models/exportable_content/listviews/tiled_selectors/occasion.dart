import 'package:flutter/material.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/clickables/occasion_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Occasion extends StatefulWidget {
  const Occasion({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _OccasionState createState() => _OccasionState();
}

class _OccasionState extends State<Occasion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              color: Colors.pink[200],
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.13,
                    right: MediaQuery.of(context).size.width * 0.13,
                  ),
                  children: const [
                    OccasionTile(
                      occasion: "Birthday",
                      icon: Icon(
                        Icons.celebration,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Christmas",
                      icon: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Wedding",
                      icon: Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Baby shower",
                      icon: Icon(
                        Icons.bathtub,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Graduation",
                      icon: Icon(
                        Icons.query_builder,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Valentine's day",
                      icon: Icon(
                        EvaIcons.heart,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Mother's day",
                      icon: Icon(
                        MdiIcons.humanFemale,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Father's day",
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    OccasionTile(
                      occasion: "",
                      icon: Icon(
                        Icons.ac_unit,
                        color: Colors.transparent,
                      ),
                    ),
                    OccasionTile(
                      occasion: "Other",
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /* Positioned(
              top: MediaQuery.of(context).size.height * 0.72,
              left: MediaQuery.of(context).size.width * 0.12,
              child: const CustomBackButton(),
            ), */
          ],
        ),
      ),
    );
  }
}
