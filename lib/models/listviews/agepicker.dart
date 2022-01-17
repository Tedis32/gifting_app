import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/clickables/backbutton.dart';
import 'package:gifting_app/models/clickables/selected_age.dart';
import 'package:gifting_app/models/listviews/tiled_selectors/gender_selector.dart';
import 'package:provider/provider.dart';
import 'package:vertical_picker/vertical_picker.dart';

import '../../exportable.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AgePickerState createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  String age = "";
  @override
  Widget build(BuildContext context) {
    List<SelectedAge> items = createChildren();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
        child: CustomAppBar(title: widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red[50],
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: VerticalPicker(
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
                            builder: (context) => const GenderSelector(
                              title: "What is their gender?",
                            ),
                          ),
                        );
                      }),
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

  List<SelectedAge> createChildren() {
    List<SelectedAge> list = [];
    int start = 0;
    for (var i = 0; i < 8; i++) {
      i == 7
          ? list.add(
              SelectedAge(ageValue: start.toString() + " + "),
            )
          : list.add(
              SelectedAge(
                  ageValue:
                      start.toString() + " - " + (start + 10).toString() //,
                  ),
            );
      start += 10;
    }
    return list;
  }
}
