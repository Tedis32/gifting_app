import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Exportable with ChangeNotifier, DiagnosticableTreeMixin {
  Exportable(this.budget, this.ageMinimum, this.ageMaximum);
  int budget;
  int ageMinimum, ageMaximum;

  void minAgeDeconstructor(String input) {
    ageMinimum = int.parse(input.substring(0, 2));
  }

  void maxAgeDeconstructor(String input) {
    ageMaximum = int.parse(input.substring(input.length - 3));
  }
}
