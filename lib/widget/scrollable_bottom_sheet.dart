import 'package:flutter/material.dart';
import 'package:flutter_modal_example/widget/modal_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final draggableScrollableSheetControllerProvider =
    StateProvider.autoDispose<DraggableScrollableController>((ref) {
  final controller = DraggableScrollableController();
  void listener() {
    if (!controller.isAttached) {
      return;
    }
    ref.read(_mapItemModalScrollExtentProvider.notifier).state =
        controller.size;
  }

  controller.addListener(listener);
  ref.onDispose(() {
    controller.removeListener(listener);
    controller.dispose();
  });
  return controller;
});

final mapSizeProvider = StateProvider.autoDispose<double>((ref) => 0.5);
final _mapItemModalScrollExtentProvider =
    StateProvider.autoDispose<double>((ref) => 0);

class CustomBottomSheetModal extends ConsumerStatefulWidget {
  const CustomBottomSheetModal({super.key, required this.snapSize});

  final double snapSize;
  @override
  ConsumerState<CustomBottomSheetModal> createState() =>
      _CustomBottomSheetModalState();
}

class _CustomBottomSheetModalState
    extends ConsumerState<CustomBottomSheetModal> {
  @override
  Widget build(BuildContext context) {
    final size = ref.watch(mapSizeProvider);

    // add this line to break the code
    // final scrollExtent = ref.watch(_mapItemModalScrollExtentProvider);
    final controller = ref.watch(draggableScrollableSheetControllerProvider);
    return DraggableScrollableSheet(
        snap: true,
        snapSizes: [size],
        controller: controller,
        minChildSize: 0.0,
        initialChildSize: 0.0,
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
