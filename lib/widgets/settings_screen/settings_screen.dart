import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';
import 'package:todo/localizations.dart';
import 'package:todo/widgets/settings_screen/settings_store.dart';

class SettingsScreen extends StatelessWidget {
  static const _languages = const {
    'en': 'English',
    'de': 'Deutsch',
    'pl': 'Polski',
  };

  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsStore store = Provider.of<SettingsStore>(context);

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(AppLocalizations.of(context).settingsScreenDarkModeLabel),
                Observer(
                  builder: (_) => Switch(
                    activeColor: Theme.of(context).accentColor,
                    value: store.isDarkMode,
                    onChanged: (value) => store.isDarkMode = value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(AppLocalizations.of(context).settingsScreenLanguageLabel),
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) => RadioButtonGroup(
                  activeColor: Theme.of(context).accentColor,
                  labels: _languages.values.toList(),
                  onChange: (_, answerIndex) => store.language = _languages.keys.toList()[answerIndex],
                  picked: _languages[store.language],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
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
