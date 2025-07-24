/// Study Phonics App - List Page
/// 
/// This page displays a grid of phonics sounds that users can tap to learn.
/// It serves as the main navigation hub for the phonics learning app.
/// 
/// Features:
/// - Grid layout of phonics sounds
/// - Responsive design based on screen size
/// - Navigation to individual phonics lessons
/// - Custom styling with shadows and colors
/// 

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'extension.dart';
import 'constant.dart';
import 'homepage.dart';

/// Main list page that displays all phonics sounds in a grid layout
/// This is the entry point of the app where users can select which
/// phonics sound they want to practice. The page uses a responsive
/// grid layout that adapts to different screen sizes.
class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ListWidget();

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
/// Contains reusable UI components like the app bar
/// to keep the main widget clean and organized
class ListWidget {

  /// Creates the app bar with title and styling
  /// Returns a custom AppBar with:
  /// - App title with custom font and shadow
  /// - Pink background color
  /// - Centered title
  listAppBar() => AppBar(
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
