import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/screens/explore_screen.dart';
import 'package:brinvestyuk/screens/home/home.dart';
import 'package:brinvestyuk/view_models/list_views/login_list_view.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/textfield/text_rounded.dart';
import 'package:brinvestyuk/widgets/title.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false;
  bool _emailValid = true;
  bool _passValid = true;
  bool passSecure = true;
  bool _button = false;

  _doLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => visible = true);
    final loginListView = Provider.of<LoginListView>(context, listen: false);

    try {
      loginListView.doLogin(emailController.text, passwordController.text);

      if (loginListView.login != null) {
        prefs.setString("token",
            "${loginListView.login!.tokenType} ${loginListView.login!.accessToken}");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }

      setState(() {
        visible = false;
      });
    } catch (e) {
      setState(() {
        visible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: DefaultTitle(
                            text: "Login",
                            size: 36,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Center(
                          child: BRIText(
                            text:
                                "Selamat datang kembali, Yuk berinvestasi \ndi BRInvest",
                            textAlign: TextAlign.center,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      maintainSemantics: true,
                      maintainInteractivity: true,
                      visible: visible,
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    TextFieldRounded(
                      controller: emailController..text,
                      labelText: "Alamat E-mail",
                      hintText: "email@email.com",
                      isPassword: false,
                      onChanges: (val) => setState(
                        () {
                          if (EmailValidator.validate(emailController.text)) {
                            _emailValid = true;
                            if (_passValid && passwordController.text != "") {
                              _button = true;
                            }
                          } else {
                            _emailValid = false;
                            _button = false;
                          }
                        },
                      ),
                      validation: !_emailValid
                          ? Text(
                              "Harus berupa e-mail yang valid",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : null,
                    ),
                    TextFieldRounded(
                      controller: passwordController..text,
                      labelText: "Kata sandi",
                      hintText: "*******",
                      isPassword: true,
                      obscure: passSecure,
                      onTap: () => setState(() => passSecure = !passSecure),
                      onChanges: (val) => setState(() {
                        if (val.length > 5) {
                          _passValid = true;
                          if (_emailValid && emailController.text != "") {
                            _button = true;
                          }
                        } else {
                          _passValid = false;
                          _button = false;
                        }
                      }),
                      validation: !_passValid
                          ? Text(
                              "Minimum 6 karakter",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : null,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: _button && _emailValid && _passValid
                          ? _activeButton(context)
                          : _disableButton(context),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "Lupa Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  color: PRIMARY),
                            ),
                            onTap: () => {print("lupa password")},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _disableButton(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      child: Text(
        "Masuk",
        style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromRGBO(0, 0, 0, .2),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.04,
            horizontal: MediaQuery.of(context).size.width * 0.25,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        animationDuration: Duration(
          seconds: 750,
        ),
      ),
    );
  }

  Widget _activeButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _doLogin(context),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          SECONDARY,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.04,
            horizontal: MediaQuery.of(context).size.width * 0.25,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        animationDuration: Duration(
          seconds: 750,
        ),
      ),
      child: Text(
        "Masuk",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
