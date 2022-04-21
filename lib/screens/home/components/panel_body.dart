import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transition_concept/config/constants.dart';

class PanelBody extends StatelessWidget {
  const PanelBody({
    Key? key,
    required this.scrollController,
    required this.panelController,
  }) : super(key: key);

  final ScrollController scrollController;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      controller: scrollController,
      children: [
        const SizedBox(height: kDefaultPadding / 4),
        GestureDetector(
          onTap: () => panelController.isPanelOpen
              ? panelController.close()
              : panelController.open(),
          child: Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: Colors.grey[300],
              ),
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            itemCount: 4,
            itemBuilder: (context, index) => Card(
              clipBehavior: Clip.hardEdge,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              ),
              child: Image.asset(
                "assets/images/et${(index % 5) + 1}.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(width: kDefaultPadding),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: FadeTransition(
            opacity: AlwaysStoppedAnimation<double>(
              panelController.panelPosition,
            ),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.",
              maxLines: 4,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Read More",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            image: const DecorationImage(
              image: AssetImage("assets/images/et5.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                clipBehavior: Clip.hardEdge,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: FadeTransition(
            opacity: AlwaysStoppedAnimation<double>(
              panelController.panelPosition,
            ),
            child: Text(
              "Top Sights",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 75,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/et5.jpg"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                ),
              ),
              const SizedBox(width: kDefaultPadding / 2),
              Expanded(
                child: FadeTransition(
                  opacity: AlwaysStoppedAnimation<double>(
                    panelController.panelPosition,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Heading",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(height: kDefaultPadding * 4),
      ],
    );
  }
}
