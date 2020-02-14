import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/settings_screen/settings_store.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore store = Provider.of<SettingsStore>(context);

    return Center(
      child: Observer(
        builder: (context) => Switch(
          value: store.isDarkMode,
          onChanged: (value) {
            store.isDarkMode = value;
          },
        ),
      ),
    );
  }
}
