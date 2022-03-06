import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuickExportable with ChangeNotifier, DiagnosticableTreeMixin {
  QuickExportable(this.budget, this.ageMaximum, this.ageMinimum, this.gender,
      this.occasion);

  int budget;
  int ageMinimum, ageMaximum;
  String gender;
  String occasion;
}
