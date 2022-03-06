import 'package:flutter/cupertino.dart';
import 'package:gifting_app/models/quick_search_screens/quick_age.dart';
import 'package:gifting_app/models/quick_search_screens/quick_budget.dart';
import 'package:gifting_app/models/quick_search_screens/quick_gender.dart';
import 'package:gifting_app/models/quick_search_screens/quick_occasion.dart';

class QuickSearchProvider extends ChangeNotifier {
  List<bool> searchCriteriaVals = [false, false, false, false];
  List<Widget> searchTileWidgets = [
    QuickBudget(title: "Enter your budget (€)"),
    const QuickOccasion(title: "What's the occasion?"),
    const QuickAgePicker(title: "Select their age"),
    const QuickGender(),
  ];
  void updateTrue(int index) {
    searchCriteriaVals[index] = true;
    notifyListeners();
  }
}
