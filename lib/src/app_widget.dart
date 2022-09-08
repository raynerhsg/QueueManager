import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_manager/src/checkin/checkin_module.dart';
import 'package:queue_manager/src/configuration/configuration_module.dart';
import 'package:queue_manager/src/configuration/pages/configuration_page.dart';
import 'package:queue_manager/src/home/home_page.dart';
import 'package:queue_manager/src/queue/queue_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
        ...checkinModule,
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          //  '/' = path
          '/': (_) => const HomePage(),
          '/config': (_) => const ConfigurationPage(),
        },
      ),
    );
  }
}
