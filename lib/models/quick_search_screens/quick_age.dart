import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/clickables/quick_clickables.dart/quick_selected_age.dart';
import 'package:gifting_app/models/exportable_content/clickables/selected_age.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/gender_selector.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:provider/provider.dart';
import 'package:vertical_picker/vertical_picker.dart';

import '../../../exportable.dart';
import '../../app.dart';

class QuickAgePicker extends StatefulWidget {
  const QuickAgePicker({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _QuickAgePickerState createState() => _QuickAgePickerState();
}

class _QuickAgePickerState extends State<QuickAgePicker> {
  String age = "";
  @override
  Widget build(BuildContext context) {
    List<QuickSelectedAge> items = createChildren();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(title: widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 1,
                child: SizedBox(
                  child: VerticalPicker(
                    borderColor: Colors.black,
                    onSelectedChanged: (indexSelected) {
                      try {
                        Provider.of<Exportable>(context, listen: false)
                            .minAgeDeconstructor(items[indexSelected].ageValue);
                        if (Provider.of<Exportable>(context, listen: false)
                                .ageMinimum ==
                            70) {
                          Provider.of<Exportable>(context, listen: false)
                              .ageMaximum = 150;
                        } else {
                          Provider.of<Exportable>(context, listen: false)
                              .maxAgeDeconstructor(
                                  items[indexSelected].ageValue);
                          print(Provider.of<Exportable>(context, listen: false)
                              .ageMaximum);
                        }
                      } on Exception catch (_, e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    },
                    itemHeight: MediaQuery.of(context).size.height / 10,
                    items: items,
                  ),
                ),
              ),

              // Quick search confirmation button
               Consumer<QuickSearchProvider>(
                  builder: (context, quickSearchProvider, _) => Positioned(
                    top: MediaQuery.of(context).size.height * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Text("Select Age"),
                      onPressed: () {
                        quickSearchProvider.updateTrue(2);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }

  List<QuickSelectedAge> createChildren() {
    List<QuickSelectedAge> list = [];
    int start = 0;
    for (var i = 0; i < 8; i++) {
      i == 7
          ? list.add(
              QuickSelectedAge(ageValue: start.toString() + " + "),
            )
          : list.add(
              QuickSelectedAge(
                  ageValue:
                      start.toString() + " - " + (start + 10).toString() //,
                  ),
            );
      start += 10;
    }
    return list;
  }
}
