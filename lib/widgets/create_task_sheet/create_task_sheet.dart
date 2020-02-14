import 'package:flutter/material.dart';
import 'package:todo/localizations.dart';
import 'package:todo/widgets/create_task_sheet/create_task_sheet_store.dart';

class CreateTaskSheet extends StatefulWidget {
  CreateTaskSheet({Key key}) : super(key: key);

  @override
  _CreateTaskSheetState createState() => _CreateTaskSheetState();
}

class _CreateTaskSheetState extends State<CreateTaskSheet> {
  final store = CreateTaskSheetStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) => store.title = value,
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).createTaskSheetTextFieldTitle,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            onChanged: (value) => store.description = value,
            cursorColor: Theme.of(context).accentColor,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).createTaskSheetTextFieldDescription,
            ),
          ),
          const SizedBox(height: 40),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text(AppLocalizations.of(context).createTaskSheetButton),
            onPressed: store.validTitle
                ? () {
                    store.addTask();
                    Navigator.of(context).pop();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
