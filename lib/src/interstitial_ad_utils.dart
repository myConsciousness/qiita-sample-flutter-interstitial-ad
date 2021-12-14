// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:qiita_sample_flutter_interstitial_ad/src/interstitial_ad.dart';
import 'package:qiita_sample_flutter_interstitial_ad/src/repository/shared_preferences_key.dart';

class InterstitialAdUtils {
  static Future<void> show({
    required SharedPreferencesKey key,
  }) async {
    int count = await key.getInt(defaultValue: 0);
    count++;

    if (count >= key.limit) {
      final interstitialAd = InterstitialAd.instance;

      if (interstitialAd.isLoaded) {
        await interstitialAd.show();
        await key.setInt(value: 0);
      }
    } else {
      await key.setInt(value: count);
    }
  }
}
