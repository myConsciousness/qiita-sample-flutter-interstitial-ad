// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as admob;
import 'package:qiita_sample_flutter_interstitial_ad/src/interstitial_ad.dart';
import 'package:qiita_sample_flutter_interstitial_ad/src/interstitial_ad_utils.dart';
import 'package:qiita_sample_flutter_interstitial_ad/src/repository/shared_preferences_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await admob.MobileAds.instance.initialize();
  await InterstitialAd.instance.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _countPressedButton = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sample For Interstitial Ad'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_countPressedButton'),
              ElevatedButton(
                child: const Text('Show Ad'),
                onPressed: () async {
                  await InterstitialAdUtils.show(
                    key: SharedPreferencesKey.countPressedButton,
                  );

                  super.setState(() {
                    _countPressedButton++;
                  });
                },
              ),
            ],
          ),
        ),
      );
}
