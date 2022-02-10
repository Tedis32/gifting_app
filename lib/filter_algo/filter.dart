import 'dart:math';

import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/filter_algo/mockvalues.dart';

class Filter {
  //First some random data + supporting functions
  final List<String> occasions = [
    "Birthday",
    "Christmas",
    "Wedding",
    "Baby Shower",
    "Graduation",
    "Valentine's Day",
    "Mother's Day",
    "Father's Day"
  ];

  final List<String> ageCategories = [
    "Baby",
    "Child",
    "Toddler",
    "Teen",
    "Young Adult",
    "Adult",
    "Senior",
  ];
  final List<String> genders = [
    "Male",
    "Female",
  ];
  double randomPrice() {
    Random random = Random();
    return random.nextDouble() * 100;
  }

  String randomOccasion() {
    Random random = new Random();
    return occasions[random.nextInt(occasions.length - 1)];
  }

  String randomAge() {
    Random random = Random();
    return ageCategories[random.nextInt(ageCategories.length - 1)];
  }

  String randomGender() {
    Random r = Random();
    return genders[r.nextInt(genders.length - 1)];
  }

  //For testing, use above functions to generate some random values to be stored as db
  List<MockValues> mockValues = [];

  void generateMockValues() {
    for (var i = 0; i < 500; i++) {
      mockValues.add(
        MockValues(
            price: randomPrice(),
            ageCategory: randomAge(),
            gender: randomGender(),
            occasion: randomOccasion()),
      );
    }
  }

  //Empty constructor
  Filter();
  // TO DO: Implement online database query.

  //Now generating random data is complete
  // FILTER TIME:
  List<MockValues> filterValues(Exportable exportable) {
    List<MockValues> filtered = [];

    generateMockValues();
    for (var i = 0; i < mockValues.length; i++) {
      if (mockValues[i].price <= exportable.budget && mockValues[i].gender == exportable.gender) {
        filtered.add(mockValues[i]);
        print(
          mockValues[i].price.toString() + "\t" +
              mockValues[i].ageCategory + "\t" +
              mockValues[i].gender + "\t" +
              mockValues[i].occasion,
        );
      }
    }
    return filtered;
  }
}
