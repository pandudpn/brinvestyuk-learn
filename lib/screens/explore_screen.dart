import 'package:brinvestyuk/screens/auth/login_screen.dart';
import 'package:brinvestyuk/screens/auth/register_screen.dart';
import 'package:brinvestyuk/view_models/list_views/login_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/register_list_view.dart';
import 'package:brinvestyuk/widgets/onboard/image.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/title.dart';
import 'package:brinvestyuk/constant/color.dart' as ConstantColor;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:core';

class ExploreScreen extends StatelessWidget {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.14,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/onboard/onboard.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: OnboardImage(
                          image: "assets/images/onboard/onboard_4.png",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: DefaultTitle(
                          text: 'Tunggu Apalagi "BeR-Invest-Yuk"!!!',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: BRIText(
                          text:
                              "Makan Bareng Sudah Biasa, Nongkrong Bareng Sudah Biasa, Yang Luar Biasa Itu Investasi Bareng",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: OutlinedButton(
                          onPressed: () => print("masuk homepage"),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              BorderSide(
                                style: BorderStyle.solid,
                                color: ConstantColor.SECONDARY,
                                width: 1.5,
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.03,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.25,
                              ),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            animationDuration: Duration(
                              seconds: 750,
                            ),
                          ),
                          child: Text(
                            "Explore",
                            style: TextStyle(
                              color: ConstantColor.SECONDARY,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: OutlinedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (context) => RegisterListView(),
                                  builder: (context, child) => RegisterScreen(),
                                ),
                              )),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              ConstantColor.SECONDARY,
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.03,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.25,
                              ),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            animationDuration: Duration(
                              seconds: 750,
                            ),
                          ),
                          child: Text(
                            "Langsung daftar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sudah memiliki akun? ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ConstantColor.PRIMARY,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (context) => LoginListView(),
                                  builder: (context, child) => LoginScreen(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit");
      return false;
    }

    currentBackPressTime = null;
    return true;
  }
}
