import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heirrand/screens/splash_screen.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "heirrand",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Heirrand',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: Colors.green,
            )),
        home: SplashPage(),
      );
  }
}
