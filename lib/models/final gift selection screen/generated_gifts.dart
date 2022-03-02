import 'package:flutter/material.dart';
import 'package:gifting_app/filter_algo/filter.dart';
import 'package:gifting_app/filter_algo/mockvalues.dart';
import 'package:gifting_app/home/home.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Create instance of filter just to access the filterValues() function
    Filter filter = Filter();
    // Create an exportable based on provider
    Exportable finalized = Exportable(
      Provider.of<Exportable>(context).budget,
      Provider.of<Exportable>(context).ageMinimum,
      Provider.of<Exportable>(context).ageMaximum,
      Provider.of<Exportable>(context).gender,
      Provider.of<Exportable>(context).occasion,
      Provider.of<Exportable>(context).shopLocal,
    );
    // Filter through Mock gift items to only access the ones needed
    List<MockValues> filtered = filter.filterValues(finalized);
    // Next line is just for list view
    List<Widget> items = [];
    // Add filtered items to listview
    for (var i = 0; i < filtered.length; i++) {
      items.add(
        exportableObject(filtered[i], context),
      );
    }
    print(items.length);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: CustomAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: ListView(
                  shrinkWrap: true,
                  children: items,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.81,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: const Text("Try again?"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exportableObject(MockValues mockValue, BuildContext context) {
    return ListTile(
      title: const Text("Generated Product"),
      subtitle: Text("${mockValue.price}"),
      trailing: Text("${mockValue.occasion} " "present"),
      leading: Image.asset("assets/images/giftbox.jpg"),
    );
  }
}
