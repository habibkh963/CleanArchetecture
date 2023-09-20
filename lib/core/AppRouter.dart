import 'package:cleaarchapp/main.dart';
import 'package:flutter/material.dart';

import '../features/Posts/Presentaion/Screens/ShowPostsScreen.dart';

onGenerateRoute(settings) {
  switch (settings.name) {
    case '/':
      MaterialPageRoute(
        builder: (context) => ShowPostsScreen(title: "title"),
      );
    default:
      '/';
  }
}
