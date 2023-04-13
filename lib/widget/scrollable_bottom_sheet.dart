import 'package:flutter/material.dart';

class CustomBottomSheetModal extends StatefulWidget {
  const CustomBottomSheetModal({super.key, required this.controller});

  final DraggableScrollableController controller;
  @override
  State<CustomBottomSheetModal> createState() => _CustomBottomSheetModalState();
}

class _CustomBottomSheetModalState extends State<CustomBottomSheetModal> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        snap: true,
        snapSizes: const [0.4],
        controller: widget.controller,
        minChildSize: 0.0,
        initialChildSize: 0.0,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
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
        });
  }
}
