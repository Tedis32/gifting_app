import 'package:flutter/material.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/quick_search/quick_search_tile.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:gifting_app/quick_exportable.dart';
import 'package:provider/provider.dart';

import '../exportable.dart';

class GiftSearch extends StatefulWidget {
  const GiftSearch({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _GiftSearchState createState() => _GiftSearchState();
}

class _GiftSearchState extends State<GiftSearch> {
  @override
  Widget build(BuildContext context) {
    // The searchCriteria widget list points to the quick_search_provider.dart/searchCriteriaVals list to change the state of the checkbox
    List<Criteria> searchCriteriaList = [
      Criteria(
        title: "Select Your Budget",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[0],
        index: 0,
      ),
      Criteria(
        title: "Select The Occasion",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[1],
        index: 1,
      ),
      Criteria(
        title: "Select Their Age",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[2],
        index: 2,
      ),
      Criteria(
        title: "Select Their Gender",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[3],
        index: 3,
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                width: MediaQuery.of(context).size.width * 1,
                top: MediaQuery.of(context).size.height * 0.1,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(1),
                  children: searchCriteriaList,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.7,
                child: Consumer<Exportable>(
                  builder: (context, exportable, _) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      QuickExportable(
                          exportable.budget,
                          exportable.ageMinimum,
                          exportable.ageMaximum,
                          exportable.gender,
                          exportable.occasion);
                    },
                    child: const Text("GO!"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
