import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/category_task_screen.dart';



void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//  SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//     statusBarColor: Colors.black,
//   )
//  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryTask(),
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
