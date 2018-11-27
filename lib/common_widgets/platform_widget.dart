import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Base class to be extended by all platform aware widgets
abstract class PlatformWidget<C extends Widget, M extends Widget>
    extends StatelessWidget {
  PlatformWidget({Key key}) : super(key: key);

  C buildCupertinoWidget(BuildContext context);
  M buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // Use Cupertino on iOS
      return buildCupertinoWidget(context);
    }
    // Use Material design on Android and other platforms
    return buildMaterialWidget(context);
  }
}
