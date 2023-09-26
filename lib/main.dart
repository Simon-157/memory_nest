import 'package:flutter/material.dart';
import 'package:memory_nest/app/router.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseMessaging.instance.getInitialMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'memorynest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRoutes.returnRouter(false),
    );
  }
}
