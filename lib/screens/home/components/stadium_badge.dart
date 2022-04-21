import 'package:flutter/material.dart';
import 'package:transition_concept/config/constants.dart';

class StadiumBadge extends StatelessWidget {
  const StadiumBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.green,
      ),
      child: const Text(
        "ON SALE",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
