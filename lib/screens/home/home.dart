import 'dart:ui';

import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/constant/constant.dart';
import 'package:brinvestyuk/screens/home/investment.dart';
import 'package:brinvestyuk/screens/home/product_list.dart';
import 'package:brinvestyuk/screens/home/top_bar.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;
  int a = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            a++;
          });
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.3, 0.8],
                      colors: [
                        Color.fromRGBO(253, 130, 0, 1),
                        Color.fromRGBO(255, 180, 35, 1),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TopBar(
                          size: size,
                          name: "Pandu dwi Putra Nugroho",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Investment(size: size),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(
                          height: 5,
                          thickness: 8,
                          color: Color(0xffaaaaaa).withOpacity(.2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Kesempatan Investasi nih!",
                                style: TextStyle(
                                  color: PRIMARY,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Lihat semua",
                                    style: TextStyle(
                                      color: SECONDARY,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: SECONDARY,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProductsHome(),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(
                          height: 5,
                          thickness: 8,
                          color: Color(0xffaaaaaa).withOpacity(.2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Belajar Investasi yuk!",
                                style: TextStyle(
                                  color: PRIMARY,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Lihat semua",
                                    style: TextStyle(
                                      color: SECONDARY,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: SECONDARY,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProductsHome(),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
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
