import 'package:flutter/material.dart';
import 'package:flutter_modal_example/widget/modal_content.dart';

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
            child: ModalContent(scrollController: scrollController),
          );
        });
  }
}
