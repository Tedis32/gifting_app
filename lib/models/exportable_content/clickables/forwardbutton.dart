import 'package:flutter/material.dart';

class ForwardButton extends StatefulWidget {
  const ForwardButton({Key? key, required Widget newPage}) : super(key: key);

  get newPage => newPage;

  @override
  _ForwardButtonState createState() => _ForwardButtonState();
}

class _ForwardButtonState extends State<ForwardButton> {
  @override
  Widget build(BuildContext context) {
    void overRideOnPressed() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget.newPage,
          ));
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.black87,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        color: Colors.white,
        splashRadius: 10,
        iconSize: 40,
        icon: const Icon(Icons.arrow_forward_rounded),
        onPressed: overRideOnPressed,
      ),
    );
  }
}
