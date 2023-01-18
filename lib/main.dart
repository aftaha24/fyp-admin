import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_admin_app/firebase_options.dart';
import 'package:traceebee_admin_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_admin_app/providers/providers.dart';

void main() {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: List.from(providers),
      child: ScreenUtilInit(
        designSize: const Size(375, 720),
        builder: (context, child) {
          return MaterialApp(
            title: 'TraceeBee Admin',
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const LoginScreen(),
      ),
    );
  }
}
