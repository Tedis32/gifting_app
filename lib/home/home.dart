import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      /* bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.red[300],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Gifting',
          ),
        ],
      ), */
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
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
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Search bar
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
              ),

              //First text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.32,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Text(
                  "Search users and gifts!",
                  style: GoogleFonts.alata(
                    textStyle:
                        const TextStyle(color: Colors.black87, fontSize: 19),
                  ),
                ),
              ),

              //Second Text
              Positioned(
                top: MediaQuery.of(context).size.height * 0.50,
                right: MediaQuery.of(context).size.width * 0.09,
                child: Text(
                  "Or simply let our algorithm \nhelp you find a gift!",
                  style: GoogleFonts.alata(
                    textStyle:
                        const TextStyle(color: Colors.black87, fontSize: 19),
                  ),
                ),
              ),
              //Button
              Positioned(
                top: MediaQuery.of(context).size.height * 0.83,
                right: MediaQuery.of(context).size.width * 0.1,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Intro(),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
