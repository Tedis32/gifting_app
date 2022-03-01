import 'package:flutter/material.dart';
import 'package:gifting_app/exportable.dart';
import 'package:gifting_app/home/start_screen.dart';
import 'package:gifting_app/providers/budgetprovider.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Exportable(0, 0, 0, "", "", true)),
        ChangeNotifierProvider(
          create: (_) => BudgetProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/home': (context) => const Home(
                title: "Home",
              ),
        },
        initialRoute: '/home',
        theme: ThemeData(
          canvasColor: Colors.pink[200],
          primaryTextTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),
              button: TextStyle(color: Colors.black)),
        ),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}

/* class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
 */