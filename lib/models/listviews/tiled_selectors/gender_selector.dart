import 'package:flutter/material.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/clickables/backbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: [
                  GridItem(
                    "Male",
                    Colors.blue,
                    const Icon(Icons.male),
                  ),
                  GridItem(
                    "Female",
                    Colors.pink,
                    const Icon(Icons.female),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              height: 150,
              width: 120,
              child: GridItem(
                "Other",
                Colors.grey,
                const Icon(
                  Icons.search,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.07),
              child: CustomBackButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget GridItem(String s, Color colour, Icon icon) {
    return InkWell(
      onTap: () {
        Provider.of<Exportable>(context, listen: false).gender = s;
        print(Provider.of<Exportable>(context, listen: false).gender);
      },
      child: Card(
        color: colour,
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Center(
                    child: Text(
                      s + "\n",
                      style: GoogleFonts.poppins(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                WidgetSpan(
                  child: Center(
                    child: icon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
