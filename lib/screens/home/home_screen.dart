import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transition_concept/config/constants.dart';
import 'package:transition_concept/screens/home/components/image_body.dart';
import 'package:transition_concept/screens/home/components/panel_body.dart';
import 'package:transition_concept/screens/home/components/stadium_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.25;
    final panelHeightOpened = MediaQuery.of(context).size.height * 0.85;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_downward),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: kDefaultPadding),
        ],
      ),
      body: SlidingUpPanel(
        controller: panelController,
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpened,
        // isDraggable: false,
        parallaxEnabled: true,
        parallaxOffset: 0.7,
        body: ImageBody(panelController: panelController),
        panelBuilder: (scrollController) => PanelBody(
          scrollController: scrollController,
          panelController: panelController,
        ),
        onPanelSlide: (position) {
          setState(() {});
        },
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(kDefaultBorderRadius * 2),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SlideTransition(
        position: const AlwaysStoppedAnimation<Offset>(Offset(0, 0.05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ScaleTransition(
              scale: panelController.isAttached
                  ? AlwaysStoppedAnimation<double>(
                      (1 - panelController.panelPosition * 2) < 0
                          ? 0
                          : (1 - panelController.panelPosition * 2),
                    )
                  : const AlwaysStoppedAnimation<double>(1),
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.airplanemode_active_sharp),
              ),
            ),
            ScaleTransition(
              scale: panelController.isAttached
                  ? AlwaysStoppedAnimation<double>(
                      panelController.panelPosition)
                  : const AlwaysStoppedAnimation<double>(0),
              child: SlideTransition(
                position: const AlwaysStoppedAnimation<Offset>(
                  Offset(0, -1.2),
                ),
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  icon: const Icon(Icons.airplanemode_active_sharp),
                  label: Row(
                    children: const [
                      Text("Search Flights"),
                      SizedBox(width: kDefaultPadding / 2),
                      StadiumBadge(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
