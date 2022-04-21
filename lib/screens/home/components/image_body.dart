import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transition_concept/config/constants.dart';
import 'package:transition_concept/screens/home/components/stadium_badge.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({
    Key? key,
    required this.panelController,
  }) : super(key: key);

  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: panelController.panelPosition * 10,
            sigmaY: panelController.panelPosition * 10,
          ),
          child: Image.asset(
            "assets/images/et1.jpg",
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.3,
          left: kDefaultPadding,
          right: kDefaultPadding,
          child: FadeTransition(
            opacity: AlwaysStoppedAnimation<double>(
                1 - panelController.panelPosition * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StadiumBadge(),
                const SizedBox(height: kDefaultPadding / 2),
                const Text(
                  "Eiffel Tower",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined,
                        size: 18, color: Colors.white),
                    SizedBox(width: kDefaultPadding / 4),
                    Text(
                      "Paris, France",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: kDefaultPadding * 8 +
              MediaQuery.of(context).size.height *
                  panelController.panelPosition *
                  0.3,
          child: FadeTransition(
            opacity:
                AlwaysStoppedAnimation<double>(panelController.panelPosition),
            child: Column(
              children: [
                const Text(
                  "Eiffel Tower",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined,
                        size: 14, color: Colors.white),
                    SizedBox(width: kDefaultPadding / 8),
                    Text(
                      "Paris, France",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
