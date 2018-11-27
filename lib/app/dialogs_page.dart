import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_app_bar.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_button.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_scaffold.dart';

class DialogsPage extends StatelessWidget {

  void _showSnackBarWithText(BuildContext context, String text) {
    if (Platform.isIOS) {
      print('[Snackbar not supported] $text');
    } else {
      final scaffold = Scaffold.of(context);
      scaffold.hideCurrentSnackBar();
      scaffold.showSnackBar(SnackBar(
        content: Text(text),
      ));
    }
  }

  void _showHelpDialog(BuildContext context) async {
    PlatformAlertDialog(
      title: 'Platform aware widgets',
      content: 'Operating System: ' + Platform.operatingSystem,
      confirmText: 'Dismiss',
    ).show(context);
  }

  void _showTwoButtonsDialog(BuildContext context) async {
    final didLogout = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelText: 'Cancel',
      confirmText: 'Logout',
    ).show(context);
    _showSnackBarWithText(context, 'did logout: $didLogout');
  }

  void _showOneButtonDialog(BuildContext context) async {
    final didConfirm = await PlatformAlertDialog(
      title: 'Network error',
      content: 'Please try again later',
      confirmText: 'OK',
    ).show(context);
    _showSnackBarWithText(context, 'did confirm: $didConfirm');
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Platform aware AppBar'),
        actions: [
          PlatformButton(
            child: Text(
              'About',
              style: TextStyle(
                color: Platform.isIOS ? Colors.blue : Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
      ),
      body: buildContents(context),
    );
  }

  Widget buildContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlatformButton(
              child: Text('Dialog with two buttons',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => _showTwoButtonsDialog(context),
            ),
            SizedBox(height: 16.0),
            PlatformButton(
              child: Text('Dialog with one button',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => _showOneButtonDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
