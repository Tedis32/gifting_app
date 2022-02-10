import 'package:flutter/material.dart';
import 'package:gifting_app/filter_algo/filter.dart';
import 'package:gifting_app/filter_algo/mockvalues.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:provider/provider.dart';

import '../../exportable.dart';

class GeneratedGiftsScreen extends StatefulWidget {
  const GeneratedGiftsScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _GeneratedGiftsScreenState createState() => _GeneratedGiftsScreenState();
}

class _GeneratedGiftsScreenState extends State<GeneratedGiftsScreen> {
  @override
  Widget build(BuildContext context) {
    Filter filter = Filter();
    Exportable finalized = Exportable(
      Provider.of<Exportable>(context).budget,
      Provider.of<Exportable>(context).ageMinimum,
      Provider.of<Exportable>(context).ageMaximum,
      Provider.of<Exportable>(context).gender,
      Provider.of<Exportable>(context).occasion,
      Provider.of<Exportable>(context).shopLocal,
    );
    List<MockValues> items = filter.filterValues(finalized);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: Container(),
    );
  }
}
