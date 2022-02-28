import 'package:flutter/material.dart';

class GiftSearch extends StatefulWidget {
  const GiftSearch({Key? key}) : super(key: key);

  @override
  _GiftSearchState createState() => _GiftSearchState();
}

class _GiftSearchState extends State<GiftSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            //Background image edit
            image: DecorationImage(
              image: AssetImage('assets/images/background_3.png'),
              fit: BoxFit.cover,
            ),
          ),),
    );
  }
}
