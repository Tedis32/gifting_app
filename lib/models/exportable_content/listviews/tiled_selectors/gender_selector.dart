import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/home/home.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/final%20gift%20selection%20screen/generated_gifts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'occasion.dart';

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
                crossAxisCount: 3,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: [
                  GridItem(
                    "Male",
                    Colors.indigo,
                    const Icon(
                      Icons.male,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                  GridItem(
                    "Female",
                    Colors.pink,
                    const Icon(
                      Icons.female,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                  GridItem(
                    "Unisex",
                    Colors.grey,
                    const Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),

            //Back Button
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: MediaQuery.of(context).size.height * 0.14),
                  child: const CustomBackButton(),
                ),
                // Forward Button
                //
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.5,
                      top: MediaQuery.of(context).size.height * 0.14),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      color: Colors.white,
                      splashRadius: 10,
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_forward_rounded),
                      onPressed: () {
                        Provider.of<Exportable>(context, listen: false).gender =
                            genderController.text;
                        genderController.text.isEmpty
                            ? Fluttertoast.showToast(
                                msg: 'Please select or enter a gender',
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1)
                            : Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const GeneratedGiftsScreen(
                                    title: 'Here\'s what we got',
                                  ),
                                ),
                                (route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Back Button
            //
          ],
        ),
      ),
    );
  }

  Widget GridItem(String s, Color colour, Icon icon) {
    return InkWell(
      onTap: () {
        Provider.of<Exportable>(context, listen: false).gender = s;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const GeneratedGiftsScreen(
                title: 'Here\'s what we got',
              ),
            ),
            (route) => false);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
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
