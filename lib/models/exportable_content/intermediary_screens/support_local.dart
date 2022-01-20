import 'package:flutter/material.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/intermediary_screens/select_their_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupportLocal extends StatefulWidget {
  const SupportLocal({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SupportLocalState createState() => _SupportLocalState();
}

class _SupportLocalState extends State<SupportLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<Exportable>(context, listen: false)
                              .shopLocal = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectTheirDetails(),
                            ),
                          );
                        },
                        child: Text(
                          'Yes',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.15,
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          Provider.of<Exportable>(context, listen: false)
                              .shopLocal = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectTheirDetails(),
                            ),
                          );
                        },
                        child: Text(
                          'No',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.83,
                left: MediaQuery.of(context).size.height * 0.05,
                child: const CustomBackButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
