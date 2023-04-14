import 'package:flutter/material.dart';

class ModalContent extends StatelessWidget {
  const ModalContent({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
