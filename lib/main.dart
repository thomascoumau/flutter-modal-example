import 'package:flutter/material.dart';
import 'package:flutter_modal_example/style/style.dart';
import 'package:flutter_modal_example/widget/modals.dart';
import 'package:flutter_modal_example/widget/scrollable_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String _title = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SheetController sheetController = SheetController();
  late DraggableScrollableController controller =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async => controller.animateTo(0.0,
            curve: Curves.easeOutQuad,
            duration: const Duration(milliseconds: 400)),
        child: CustomSlidingSheet(
          sheetController: sheetController,
          body: Stack(
            children: [
              SizedBox.expand(
                child: ColoredBox(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        PhotoView(
                          disableGestures: false,
                          imageProvider: const AssetImage("assets/Arves.jpg"),
                        ),
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              Button(
                                text: 'open flutter modal',
                                onPressed: () async {
                                  controller.animateTo(0.4,
                                      curve: Curves.decelerate,
                                      duration:
                                          const Duration(milliseconds: 400));
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Button(
                                  text: 'sliding sheet modal',
                                  onPressed: () {
                                    sheetController.snapToExtent(0.4);
                                  })
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              CustomBottomSheetModal(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
