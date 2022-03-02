import 'package:flutter/cupertino.dart';

class BudgetProvider with ChangeNotifier {
  String value = "";

  String getValue() {
    return value;
  }

  int getValueAsInt() {
    if (value == "") {
      return 0;
    } else {
      return int.parse(value);
    }
  }

  void setValue(int newValue) {
    value += newValue.toString();
    notifyListeners();
  }

  void removeValue() {
    String oneRemoved = "";
    if (value == oneRemoved) {
      value = value;
    } else {
      for (var i = 0; i < value.length - 1; i++) {
        oneRemoved += value[i];
      }
      value = oneRemoved;
    }
    notifyListeners();

    //value = value.substring(0, value.length - 1);
  }

  void clearValues() {
    value = "";
    notifyListeners();
  }
}
