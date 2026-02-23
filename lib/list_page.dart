import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'extension.dart';
import 'constant.dart';
import 'homepage.dart';

/// List Page
/// Main list page that displays all phonics sounds in a grid layout
/// This is the entry point of the app where users can select which
/// phonics sound they want to practice. The page uses a responsive
/// grid layout that adapts to different screen sizes.
class ListPage extends HookConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ListWidget();

    // Initialized app
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async => FlutterNativeSplash.remove());
      return null;
    }, []);

    return Scaffold(
      /// App Bar with title and styling
      appBar: list.listAppBar(),      
      /// Main content area with phonics grid
      body: Container(
        color: pinkColor, // Background color
        padding: EdgeInsets.all(listTopMargin), // Padding around the grid
        child: GridView.count(
          crossAxisCount: context.listRowNumber(), // Responsive column count
          crossAxisSpacing: listMargin, // Horizontal spacing between items
          mainAxisSpacing: listMargin, // Vertical spacing between items
          children: List.generate(allPhonics.length, (i) => Container(
            padding: const EdgeInsets.all(listPadding),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: blueColor), // Item background
            child: GridTile(
              child: TextButton(
                child: Text(allPhonics[i], // Display phonics sound
                  style: TextStyle(
                    color: whiteColor, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                    fontSize: listCharSize, // Text size
                    shadows: [myShadow()], // Text shadow for depth
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomePage(index: i) // Navigate to phonics lesson
                )),
              ),
            ),
          )),
        ),
      ),
    );
  }
}

/// Helper class for list page components
class ListWidget {

  /// The app bar with title and styling
  AppBar listAppBar() => AppBar(
    title: Text(myTitle, // App title from constants
      style: TextStyle(
        fontWeight: FontWeight.bold, // Bold title
        fontSize: appBarFontSize, // Title font size
        color: whiteColor, // White text color
        shadows: [myShadow()], // Title shadow for depth
      ),
    ),
    backgroundColor: pinkColor, // Pink background
    centerTitle: true, // Center the title
  );
}
