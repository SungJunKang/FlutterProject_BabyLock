import 'package:babylock/login.dart';
import 'package:flutter/material.dart';

import 'package:babylock/main.dart';
import 'package:babylock/playlist.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/mainpage': (BuildContext context) => MyHomePage(title: 'BabyLock'),
  '/playlist': (BuildContext context) => PlayList(), 
  '/loginPage': (BuildContext context) => LoginPage(),
};