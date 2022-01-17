import 'package:flutter/material.dart';
import 'package:gifting_app/models/appbar.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
    );
  }
}
