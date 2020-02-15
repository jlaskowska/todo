import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/localizations.dart';
import 'package:todo/widgets/settings_screen/settings_store.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore store = Provider.of<SettingsStore>(context);

    return Center(
      child: Column(
        children: <Widget>[
          Observer(
            builder: (context) => Switch(
              activeColor: Theme.of(context).accentColor,
              value: store.isDarkMode,
              onChanged: (value) => store.isDarkMode = value,
            ),
          ),
          RaisedButton(
            onPressed: () => store.deleteAllTasks(),
            child: Text(
              AppLocalizations.of(context).settingsScreenButtonDeleteAll,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
