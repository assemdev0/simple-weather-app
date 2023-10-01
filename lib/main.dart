import 'package:flutter/material.dart';
import '/core/services/services_locator.dart';

import 'app.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}
