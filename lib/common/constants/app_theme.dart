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
        shape: RoundedRectangleBorder(
          borderRadius: CommonWidgets.circularBorder(radius: 10),
        ),
      ),
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[200],
        minimumSize: const Size.fromRadius(20),
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
