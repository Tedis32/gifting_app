import 'package:flutter/material.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/clickables/quick_search/quick_search_tile.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/budget.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/occasion.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: "Select Budget",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[0],
        index: 0,
      ),
      Criteria(
        title: "Select Occasion",
        selected:
            Provider.of<QuickSearchProvider>(context).searchCriteriaVals[1],
        index: 1,
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight(context)),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: ListView(
          children: searchCriteriaList,
        ),
      ),
    );
  }
}
