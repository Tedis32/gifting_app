import 'package:flutter/material.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuickBudgetButton extends StatefulWidget {
  const QuickBudgetButton({Key? key, required this.constValue})
      : super(key: key);
  final String constValue;
  @override
  _QuickBudgetButtonState createState() => _QuickBudgetButtonState();
}

class _QuickBudgetButtonState extends State<QuickBudgetButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (widget.constValue == "C") {
              Provider.of<BudgetProvider>(context, listen: false).clearValues();
            } else if (widget.constValue == "Del") {
              Provider.of<BudgetProvider>(context, listen: false).removeValue();
            } else {
              Provider.of<BudgetProvider>(context, listen: false)
                  .setValue(int.parse(widget.constValue));
            }
          },
          child: Center(
            child: widget.constValue == "Del"
                ? const Icon(Icons.backspace, color: Colors.black)
                : Text(
                    widget.constValue.toString(),
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.black),
                  ),
          ),
        ),
      ),
    );
  }
}
