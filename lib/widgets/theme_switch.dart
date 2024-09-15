import 'package:flutter/material.dart';

//Teil von MainDrawer
class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  var _switchStatus = true;
  @override
  Widget build(BuildContext context) {
    return Switch(value: _switchStatus, onChanged: (newStatus) {
      setState(() {
        _switchStatus = newStatus;
      });
    });
  }
}
