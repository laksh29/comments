import 'package:comments/global/size.dart';
import 'package:comments/providers/auth_provider.dart';
import 'package:comments/providers/comments_provider.dart';
import 'package:comments/providers/firestore_provider.dart';
import 'package:comments/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'services/remote_config_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfigServices().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CommentsProvider()),
        ChangeNotifierProvider(create: (ctx) => AuthProvider()),
        ChangeNotifierProvider(create: (ctx) => FirestoreProvider()),
      ],
      child: MaterialApp(
        title: "Comments App",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
