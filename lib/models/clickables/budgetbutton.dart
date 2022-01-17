import 'package:flutter/material.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BudgetButton extends StatefulWidget {
  const BudgetButton({Key? key, required this.constValue}) : super(key: key);
  final String constValue;
  @override
  _BudgetButtonState createState() => _BudgetButtonState();
}

class _BudgetButtonState extends State<BudgetButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: Colors.red[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0.3,
            ),
          ],
        ),
        child: InkWell(
          splashColor: Colors.black,
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
                ? const Icon(Icons.backspace)
                : Text(
                    widget.constValue.toString(),
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.black87),
                  ),
          ),
        ),
      ),
    );
  }
}
