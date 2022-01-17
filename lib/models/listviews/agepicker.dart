import 'package:flutter/material.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/clickables/backbutton.dart';
import 'package:gifting_app/models/clickables/selected_age.dart';
import 'package:gifting_app/models/listviews/budget.dart';

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
                  child: ListView(
                    shrinkWrap: true,
                    children: items,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.83,
                left: MediaQuery.of(context).size.height * 0.1,
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
