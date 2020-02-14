import 'package:flutter/material.dart';
import 'package:todo/widgets/settings_screen/settings_screen.dart';
import 'package:todo/widgets/task_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> children = [
    TaskScreen(),
    SettingsScreen(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.assignment),
              onPressed: () => setState(() => index = 0),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => setState(() => index = 1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => print('FAB'),
      ),
      body: children[index],
    );
  }
}
