import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/home/gift_search_screen.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/models/exportable_content/clickables/backbutton.dart';
import 'package:gifting_app/models/exportable_content/clickables/budgetbutton.dart';
import 'package:gifting_app/models/exportable_content/clickables/quick_clickables.dart/quick_budgetbutton.dart';
import 'package:gifting_app/models/exportable_content/intermediary_screens/select_their_details.dart';
import 'package:gifting_app/models/exportable_content/intermediary_screens/support_local.dart';
import 'package:gifting_app/models/exportable_content/listviews/agepicker.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuickBudget extends StatefulWidget with ChangeNotifier {
  QuickBudget({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;
  @override
  _QuickBudgetState createState() => _QuickBudgetState();
}

class _QuickBudgetState extends State<QuickBudget> {
  @override
  Widget build(BuildContext context) {
    List<QuickBudgetButton> budgetButtons = [];
    for (var i = 0; i < 12; i++) {
      if (i == 9) {
        budgetButtons.add(const QuickBudgetButton(constValue: "C"));
      } else if (i == 10) {
        budgetButtons.add(QuickBudgetButton(constValue: 0.toString()));
      } else if (i == 11) {
        budgetButtons.add(const QuickBudgetButton(constValue: "Del"));
      } else {
        budgetButtons.add(
          QuickBudgetButton(
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
              preferredSize: Size.fromHeight(getAppbarHeight(context)),
              child: CustomAppBar(
                title: widget.title,
              ),
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Output number
                    //
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      right: MediaQuery.of(context).size.width * 0.05,
                      child: SizedBox(
                        child: Text(
                          Provider.of<BudgetProvider>(context, listen: true)
                              .getValue(),
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    // GridView
                    //
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.18,
                      child: Container(
                        padding: const EdgeInsets.all(50),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width * 1,
                        child: GridView.count(
                          padding: const EdgeInsets.all(1),
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          children: budgetButtons,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.83,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, elevation: 10),
                        onPressed: () async {
                          if (Provider.of<BudgetProvider>(context,
                                      listen: false)
                                  .value
                                  // ignore: unrelated_type_equality_checks
                                  .isEmpty ||
                              Provider.of<BudgetProvider>(context,
                                          listen: false)
                                      .value ==
                                  0.toString()) {
                            Fluttertoast.showToast(
                                msg: "Please enter your budget",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1);
                          } else {
                            Provider.of<QuickSearchProvider>(context,
                                    listen: false)
                                .updateTrue(0);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Confirm Selection"),
                      ),
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
