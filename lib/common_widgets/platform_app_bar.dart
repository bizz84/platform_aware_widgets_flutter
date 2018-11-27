import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_widget.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> {
  PlatformAppBar({this.leading, this.title, this.actions});
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  @override
  CupertinoNavigationBar buildCupertinoWidget(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing: Row(
        children: actions,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  @override
  AppBar buildMaterialWidget(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}
