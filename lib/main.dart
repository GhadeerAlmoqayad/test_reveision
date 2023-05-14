import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_reveision/prefs/shared_pref_controller.dart';
import 'package:test_reveision/provider/language_provider.dart';
import 'package:test_reveision/screens/answer_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_reveision/screens/app/home_screen.dart';
import 'package:test_reveision/screens/app/launch_screen.dart';
import 'package:test_reveision/screens/app/task_details.dart';
import 'package:test_reveision/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefController().initPreferences();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider<LanguageProvider>(
              create: (context) => LanguageProvider(),
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Color(0xFF032B77)),
                      centerTitle: true,
                      elevation: 0,
                      color: Colors.transparent,
                      titleTextStyle: GoogleFonts.cairo(
                        color: Color(0xFF032B77),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  // or this  //   localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: [
                    Locale('en', ''), // English
                    Locale('ar', ''), // Arabic
                  ],
                  locale:
                      Locale(Provider.of<LanguageProvider>(context).language),
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/home_screen',
                  routes: {
                    '/login_screen': (context) => LoginScreen(),
                    '/answer_screen': (context) => AnswerScreen(),
                    '/home_screen': (context) => HomeScreen(),
                    '/launch_screen': (context) => LaunchScreen(),
                    '/task_details': (context) => TaskDetails(),
                  },
                );
              });
        });
  }
}
