import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      left: false,
      right: false,
      top: false,
      bottom: true,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: bottom),
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
            Observer(
              builder: (_) => RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  AppLocalizations.of(context).createTaskSheetButton,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: store.validTitle
                    ? () {
                        store.addTask();
                        Navigator.of(context).pop();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
