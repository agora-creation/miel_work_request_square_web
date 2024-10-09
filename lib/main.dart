import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:miel_work_request_square_web/common/style.dart';
import 'package:miel_work_request_square_web/providers/request_square.dart';
import 'package:miel_work_request_square_web/screens/step1.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCPYXWqVx6QGgofsI2XUqMq-8V4H0hjtrg",
      authDomain: "miel-work-project.firebaseapp.com",
      projectId: "miel-work-project",
      storageBucket: "miel-work-project.appspot.com",
      messagingSenderId: "66212259980",
      appId: "1:66212259980:web:de917689000cbed03933a9",
      measurementId: "G-5XR8VLHPE7",
    ),
  );
  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  if (FirebaseAuth.instance.currentUser == null) {
    await Future.any([
      FirebaseAuth.instance.userChanges().firstWhere((e) => e != null),
      Future.delayed(const Duration(milliseconds: 3000)),
    ]);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: RequestSquareProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ja')],
        locale: const Locale('ja'),
        title: 'ひろめWORK - よさこい広場使用申込フォーム',
        theme: customTheme(),
        home: const Step1Screen(),
      ),
    );
  }
}
