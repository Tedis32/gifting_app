import 'package:flutter/material.dart';
import 'package:gifting_app/app.dart';
import 'package:gifting_app/models/appbar.dart';
import 'package:gifting_app/providers/quick_search_provider.dart';
import 'package:provider/provider.dart';

import '../../exportable.dart';

class QuickGender extends StatefulWidget {
  const QuickGender({Key? key}) : super(key: key);

  @override
  State<QuickGender> createState() => _QuickGenderState();
}

class _QuickGenderState extends State<QuickGender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getAppbarHeight(context)),
        child: const CustomAppBar(
          title: "Select their gender",
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1),
          child: Wrap(
            spacing: MediaQuery.of(context).size.width * 0.05,
            children: [
              QuickGenderTile(
                  const Icon(
                    Icons.male,
                    size: 50,
                  ),
                  "Male"),
              QuickGenderTile(
                  const Icon(
                    Icons.female,
                    size: 50,
                  ),
                  "Female"),
              QuickGenderTile(
                  const Icon(
                    Icons.search,
                    size: 50,
                  ),
                  "Unisex"),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget QuickGenderTile(Icon i, String title) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.2,
      alignment: Alignment.topCenter,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Center(
        child: SizedBox(
          child: Consumer<QuickSearchProvider>(
            builder: (context, _quickSearchProvider, _) => InkWell(
              onTap: () {
                Provider.of<Exportable>(context, listen: false).gender = title;
                _quickSearchProvider.updateTrue(3);
                Navigator.pop(context);
              },
              child: GridTile(
                child: i,
                footer: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
