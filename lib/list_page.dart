import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'common_widget.dart';
import 'extension.dart';
import 'constant.dart';
import 'main_page.dart';

class ListPage extends HookConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // ///App Tracking Transparency
        // if (Platform.isIOS || Platform.isMacOS) {
        //   final status = await AppTrackingTransparency.trackingAuthorizationStatus;
        //   if (status == TrackingStatus.notDetermined && context.mounted) {
        //     await AppTrackingTransparency.requestTrackingAuthorization();
        //   }
        // }
      });
      return null;
    }, []);

    return Scaffold(
      ///AppBar
      appBar: AppBar(
        title: myAppBarText(),
        backgroundColor: pinkColor,
        centerTitle: true,
      ),
      ///Body
      body: Container(
        color: pinkColor,
        padding: EdgeInsets.all(listTopMargin),
        child: GridView.count(
          crossAxisCount: context.listRowNumber(),
          crossAxisSpacing: listMargin,
          mainAxisSpacing: listMargin,
          children: List.generate(allPhonics.length, (i) => Container(
            padding: const EdgeInsets.all(listPadding),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: blueColor),
            child: GridTile(
              child: TextButton(
                child: Text(allPhonics[i],
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: listCharSize,
                    shadows: [myShadow()],
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MainPage(index: i))
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}


