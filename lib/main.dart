import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_admin_app/firebase_options.dart';
import 'package:traceebee_admin_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_admin_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_admin_app/providers/providers.dart';
import 'package:traceebee_admin_app/services/local_shared_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bool isLoggedIn =
      await LocalService().getSharedToken() == null ? false : true;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

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
        child: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
