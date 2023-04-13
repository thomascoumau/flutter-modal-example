import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class CustomSlidingSheet extends StatelessWidget {
  const CustomSlidingSheet({
    super.key,
    required this.body,
    required this.sheetController,
    this.animationDuration,
  });

  final Duration? animationDuration;
  final Widget body;
  final SheetController sheetController;

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      body: body,
      scrollSpec: const ScrollSpec(
        overscroll: false,
      ),
      duration: animationDuration ?? const Duration(milliseconds: 400),
      cornerRadiusOnFullscreen: 0,
      closeOnBackdropTap: true,
      elevation: 8,
      cornerRadius: 16,
      listener: (state) {},
      controller: sheetController,
      extendBody: true,
      snapSpec: const SnapSpec(
        // Enable snapping. This is true by default.
        snap: true,
        // Set custom snapping points.
        snappings: [0.0, 0.4, 1.0],
        // Define to what the snappings relate to. In this case,
        // the total available space that the sheet can expand to.
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      customBuilder: (context, scrollController, state) {
        return SizedBox(
          height: 800,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 30,
                    color: const Color.fromARGB(255, 10, 34, 75),
                  ),
                  Container(
                    height: 30,
                    color: Colors.white,
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
