import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// AdMobバナー広告を管理するクラス
class AdMobBanner extends StatefulWidget {
  const AdMobBanner({Key? key}) : super(key: key);

  @override
  State<AdMobBanner> createState() => _AdMobBannerState();
}

class _AdMobBannerState extends State<AdMobBanner> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  /// バナー広告を読み込む
  void _loadAd() {
    _bannerAd = BannerAd(
      adUnitId: _getBannerAdUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _bannerAd!.load();
  }

  /// プラットフォームに応じたバナー広告ユニットIDを取得
  String _getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return dotenv.env['ANDROID_BANNER_UNIT_ID'] ?? 
             'ca-app-pub-3940256099942544/6300978111'; // テスト用ID
    } else if (Platform.isIOS) {
      return dotenv.env['IOS_BANNER_UNIT_ID'] ?? 
             'ca-app-pub-3940256099942544/2934735716'; // テスト用ID
    }
    return 'ca-app-pub-3940256099942544/6300978111'; // デフォルト
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
} 