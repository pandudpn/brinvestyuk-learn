import 'dart:ui';

import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/constant/constant.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:flutter/material.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 19,
                              sigmaX: 19,
                            ),
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "3,6% per tahun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: PRIMARY,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: "Deposito BRI 3 Bulan",
                        size: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(0.3),
                        value: 0.1,
                        color: Color(0xfffd8300),
                        minHeight: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BRIText(
                            text: "Rp 35.000.000",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          BRIText(
                            text: "3 Bulan",
                            size: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
