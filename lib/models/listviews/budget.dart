import 'package:flutter/material.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/clickables/backbutton.dart';
import 'package:gifting_app/models/clickables/budgetbutton.dart';
import 'package:gifting_app/models/listviews/agepicker.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BudgetList extends StatefulWidget with ChangeNotifier {
  BudgetList({
    Key? key,
    required this.title,
    required this.numberValue,
  }) : super(key: key);
  String title;
  String numberValue;
  @override
  _BudgetListState createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    List<BudgetButton> budgetButtons = [];
    for (var i = 0; i < 12; i++) {
      if (i == 9) {
        budgetButtons.add(const BudgetButton(constValue: "C"));
      } else if (i == 10) {
        budgetButtons.add(BudgetButton(constValue: 0.toString()));
      } else if (i == 11) {
        budgetButtons.add(const BudgetButton(constValue: "Del"));
      } else {
        budgetButtons.add(
          BudgetButton(
            constValue: (i + 1).toString(),
          ),
        );
      }
    }
    return ChangeNotifierProvider<BudgetProvider>(
      create: (context) => BudgetProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: CustomAppBar(
                title: widget.title,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.red[50],
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      right: MediaQuery.of(context).size.width * 0.05,
                      child: SizedBox(
                        child: Text(
                          Provider.of<BudgetProvider>(context, listen: true)
                              .getValue()
                              .toString(),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.125,
                      child: Container(
                        padding: const EdgeInsets.all(50),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width * 1,
                        child: GridView.count(
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          children: budgetButtons,
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
                                  builder: (context) => const AgePicker(
                                    title: "What is their age?",
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.83,
                      left: MediaQuery.of(context).size.width * 0.1,
                      child: const CustomBackButton(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
