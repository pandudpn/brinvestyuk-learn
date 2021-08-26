import 'dart:async';

import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/screens/home/home.dart';
import 'package:brinvestyuk/view_models/list_views/register_otp_list_view.dart';
import 'package:brinvestyuk/widgets/buttons/rounded.dart';
import 'package:brinvestyuk/widgets/numeric_pad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  final String password;

  const VerificationScreen({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String code = "";
  bool _button = false;
  int start = 60;
  String startString = "01:00";
  bool wait = true;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Verifikasi",
          style: TextStyle(
            color: PRIMARY,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Masukkan kode verifikasi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: PRIMARY,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              "Masukkan kode verifikasi yang telah dikirimkan melalui email ke ",
                          style: TextStyle(
                            fontSize: 14,
                            color: PRIMARY,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: widget.email,
                              style: TextStyle(
                                fontSize: 14,
                                color: PRIMARY,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          buildCodeNumberBox(
                              code.length > 0 ? code.substring(0, 1) : ""),
                          buildCodeNumberBox(
                              code.length > 1 ? code.substring(1, 2) : ""),
                          buildCodeNumberBox(
                              code.length > 2 ? code.substring(2, 3) : ""),
                          buildCodeNumberBox(
                              code.length > 3 ? code.substring(3, 4) : ""),
                          buildCodeNumberBox(
                              code.length > 4 ? code.substring(4, 5) : ""),
                          buildCodeNumberBox(
                              code.length > 5 ? code.substring(5, 6) : ""),
                        ],
                      ),
                    ),
                    wait ? _countDown() : _textResendCode(),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _button
                          ? ButtonRounded(
                              text: "Lanjut",
                              onPresses: () =>
                                  _doVerification(context, widget.email, code),
                            )
                          : ButtonRoundedDisabled(text: "Lanjut"),
                    ),
                  ],
                ),
              ),
            ),
            NumericPad(
              onNumberSelected: (value) {
                setState(() {
                  if (value != -1) {
                    if (code.length < 6) {
                      code = code + value.toString();
                      if (code.length == 6) {
                        _doVerification(context, widget.email, code);
                        _button = true;
                      }
                    } else {
                      _button = true;
                      _doVerification(context, widget.email, code);
                    }
                  } else {
                    if (code.length > 0) {
                      code = code.substring(0, code.length - 1);
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: PRIMARY,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _countDown() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Kirim ulang kode dalam ",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          Text(
            startString,
            style: TextStyle(
              fontSize: 14,
              color: PRIMARY,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
          if (start < 10) {
            startString = "00:0${start.toString()}";
          } else {
            startString = "00:${start.toString()}";
          }
        });
      }
    });
  }

  Widget _textResendCode() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tidak menerima kode verifikasi? ",
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Resend the code to the user");
            },
            child: Text(
              "Kirim ulang",
              style: TextStyle(
                fontSize: 13,
                color: PRIMARY,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _doVerification(BuildContext context, String email, String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final otpListView =
        Provider.of<RegisterOtpListView>(context, listen: false);
    await otpListView.doVerificationOtp(email, otp);

    if (otpListView.register != null) {
      print(otpListView.register?.token);
      prefs.setString("token", otpListView.register!.token);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } else {
      setState(() {
        code = "";
        _button = false;
      });
    }
  }
}
