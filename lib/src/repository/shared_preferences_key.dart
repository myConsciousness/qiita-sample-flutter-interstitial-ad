// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey {
  countPressedButton,
}

extension KeyFeature on SharedPreferencesKey {
  int get limit {
    switch (this) {
      case SharedPreferencesKey.countPressedButton:
        return 3;
    }
  }

  Future<void> setInt({required int value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt(name, value);
  }

  Future<int> getInt({int defaultValue = -1}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(name)) {
      return sharedPreferences.getInt(name) ?? defaultValue;
    }

    return defaultValue;
  }
}
