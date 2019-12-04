import 'package:flutter/material.dart';

import 'package:babylock/main.dart';
import 'package:babylock/playlist.dart';

final routes = {
  '/': (BuildContext context) => MyHomePage(title: 'BabyLock'),
  '/playlist': (BuildContext context) => PlayList(), 
};