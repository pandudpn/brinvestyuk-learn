import 'package:brinvestyuk/screens/auth/login_screen.dart';
import 'package:brinvestyuk/screens/auth/register_screen.dart';
import 'package:brinvestyuk/screens/auth/verification_screen.dart';
import 'package:brinvestyuk/screens/explore_screen.dart';
import 'package:brinvestyuk/screens/home/home.dart';
import 'package:brinvestyuk/screens/onboarding_screen.dart';
import 'package:brinvestyuk/view_models/list_views/login_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/onboarding_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/register_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/register_otp_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? firstInstall;
String? token;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  firstInstall = prefs.getBool("firstInstall");
  token = prefs.getString("token");
  print("token $token");
  print("first install ? $firstInstall");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OnBoardingListViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => LoginListView(),
          ),
          ChangeNotifierProvider(
            create: (_) => RegisterListView(),
          ),
          ChangeNotifierProvider(
            create: (_) => RegisterOtpListView(),
          ),
        ],
        child: token != null
            ? HomeScreen()
            : firstInstall != null
                ? ExploreScreen()
                : OnboardingScreen(),
      ),
    );
  }
}
