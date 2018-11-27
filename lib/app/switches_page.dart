import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_switch.dart';

class SwitchesPage extends StatefulWidget {
  @override
  _SwitchesPageState createState() => _SwitchesPageState();
}

class _SwitchesPageState extends State<SwitchesPage> {
  bool _switchValue = false;

  void _showHelpDialog(BuildContext context) async {
    PlatformAlertDialog(
      title: 'Platform aware widgets',
      content: 'Operating System: ' + Platform.operatingSystem,
      confirmText: 'Dismiss',
    ).show(context);
  }

  void _platformSwitchChanged(BuildContext context, bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material AppBar'),
        actions: [
          FlatButton(
            child: Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () => _showHelpDialog(context),
          ),
        ],
        elevation: Platform.isIOS ? 0.0 : 4.0,
      ),
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildRow(
              text: 'Active',
              child: PlatformSwitch(
                value: _switchValue,
                onChanged: (value) => _platformSwitchChanged(context, value),
              ),
            ),
            SizedBox(height: 60.0),
            buildRow(
              text: 'Inactive',
              child: PlatformSwitch(
                value: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow({String text, Widget child}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20.0)),
        child,
      ],
    );
  }
}
