import 'package:flutter/cupertino.dart';
import 'package:gifting_app/models/exportable_content/clickables/quick_search/quick_search_tile.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/budget.dart';
import 'package:gifting_app/models/exportable_content/listviews/tiled_selectors/occasion.dart';

class QuickSearchProvider extends ChangeNotifier {
  List<bool> searchCriteriaVals = [false, false, false, false];
  List<Widget> searchTileWidgets = [
    BudgetList(title: "Enter your budget (€)"),
    const Occasion(title: "What's the occasion?"),
  ];
  void updateTrue(int index) {
    searchCriteriaVals[index] = true;
    notifyListeners();
  }
}
