import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo/conigs/app_themes.dart';
import 'package:todo/localizations.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/home_screen.dart';
import 'package:todo/widgets/settings_screen/settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // initialize hive
  final applicationDocumentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicationDocumentsDirectory.path);

  // register TaskAdapter type
  Hive.registerAdapter(TaskAdapter());

  // open hive boxes
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('settings');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsStore = SettingsStore();

    return MultiProvider(
      providers: [
        Provider.value(value: settingsStore),
      ],
      child: Observer(
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: settingsStore.isDarkMode ? AppThemes.dark : AppThemes.light,
          locale: Locale(settingsStore.language),
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizationsDelegate.supportedLocals,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
