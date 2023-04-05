import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        listTileTheme: Theme.of(context).listTileTheme.copyWith(
              tileColor: Colors.blueGrey[100],
            ),
      ),
      initialRoute: Routes.routeHome,
      getPages: AppPages.pages,
    );
  }
}
