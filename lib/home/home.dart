import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/home/gift_search_screen.dart';
import 'package:gifting_app/home/select_your_details.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/drawer.dart';
import 'package:gifting_app/providers/budgetprovider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*     TextEditingController searchController = TextEditingController();
 */

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            //Background image edit
            image: DecorationImage(
              image: AssetImage('assets/images/background_3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              /* // Search bar
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.07,
                      left: MediaQuery.of(context).size.width * 0.07,
                      top: MediaQuery.of(context).size.width * 0.25),
                  child: ListTile(
                    leading: const Icon(Icons.search, color: Colors.black38),
                    title: TextFormField(
                      autocorrect: true,
                      cursorColor: Colors.grey[600],
                      controller: searchController,
                      style: const TextStyle(color: Colors.black38),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                ),
              ), */

              /* //First text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                child: Text(
                  "Welcome to [name_insert]!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alata(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ), */

              //Text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                child: Text(
                  "Click below to try\nthe quick generator",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),

              //Button
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                child: DottedBorder(
                  color: Colors.white,
                  strokeCap: StrokeCap.butt,
                  strokeWidth: 9,
                  borderType: BorderType.Circle,
                  dashPattern: const [3, 5],
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: InkWell(
                      highlightColor: Colors.red[100],
                      customBorder: const CircleBorder(side: BorderSide.none),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GiftSearch(title: 'Quick Search'),
                          ),
                        );
                      },
                      child: Center(
                        child: GlowText(
                          "START",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                          ),
                          glowColor: Colors.yellow[200],
                          blurRadius: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /* // Text 
              Positioned(
                top: MediaQuery.of(context).size.height * 0.7,
                child: Text(
                  "Click below to use the\n advanced gift generator",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alata(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
