import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/common_widgets/platform_alert_dialog.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Active', style: TextStyle(fontSize: 20.0)),
                Switch.adaptive(
                  value: _switchValue,
                  onChanged: (value) => _platformSwitchChanged(context, value),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Inactive', style: TextStyle(fontSize: 20.0)),
                Switch.adaptive(
                  value: true,
                  onChanged: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowWithLabel extends StatelessWidget {
  const RowWithLabel({Key key, this.text, this.child}) : super(key: key);
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20.0)),
        child,
      ],
    );
  }
}
