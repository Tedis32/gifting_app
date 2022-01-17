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
  TextEditingController genderController = TextEditingController();
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
                    const Icon(
                      Icons.male,
                      size: 70,
                    ),
                  ),
                  GridItem(
                    "Female",
                    Colors.pink,
                    const Icon(
                      Icons.female,
                      size: 70,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.13),
              alignment: Alignment.bottomLeft,
              child: TextField(
                cursorColor: Colors.black,
                controller: genderController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  label: Text(
                    "Or enter your gender here...",
                    style: TextStyle(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.14),
              child: const CustomBackButton(),
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
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                /* WidgetSpan(
                  child: Center(
                    child: Text(
                      s + "\n",
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ), */
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
