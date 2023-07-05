import 'package:flutter/material.dart';
import 'package:flutter_modal_example/style/style.dart';
import 'package:flutter_modal_example/widget/scrollable_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String _title = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends ConsumerState<Home> {
  late DraggableScrollableController controller =
      DraggableScrollableController();

  @override
  Widget build(
    BuildContext context,
  ) {
    final controller = ref.watch(draggableScrollableSheetControllerProvider);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: ColoredBox(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => controller.animateTo(0,
                      curve: Curves.decelerate,
                      duration: const Duration(milliseconds: 400)),
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
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
          const CustomBottomSheetModal(
            snapSize: 0.25,
          ),
        ],
      ),
    );
  }
}
