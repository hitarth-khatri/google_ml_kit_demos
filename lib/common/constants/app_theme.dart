import 'package:flutter/material.dart';

import '../widgets/common_widgets.dart';

/// default app theme
ThemeData appThemeData({BuildContext? context}) {
  return ThemeData(
    useMaterial3: true,

    /// list tile theme
    listTileTheme: Theme.of(context!).listTileTheme.copyWith(
          tileColor: Colors.blueGrey[100],
        ),

    /// filled button theme
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: CommonWidgets.circularBorder(radius: 10),
        ),
      ),
    ),

    /// text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
