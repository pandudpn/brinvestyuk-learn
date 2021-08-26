import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/screens/auth/login_screen.dart';
import 'package:brinvestyuk/screens/auth/verification_screen.dart';
import 'package:brinvestyuk/view_models/list_views/login_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/register_list_view.dart';
import 'package:brinvestyuk/view_models/list_views/register_otp_list_view.dart';
import 'package:brinvestyuk/widgets/buttons/rounded.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/textfield/text_rounded.dart';
import 'package:brinvestyuk/widgets/title.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool visible = false;
  bool _emailValid = true;
  bool _passValid = true;
  bool _passConfirmValid = true;
  bool _button = false;
  bool passConfirmSecure = true;
  bool passSecure = true;

  _doRegister(BuildContext context) async {
    setState(() => visible = true);
    final registerListView =
        Provider.of<RegisterListView>(context, listen: false);
    await registerListView.doRegister(
        emailController.text, passwordConfirmController.text);

    if (registerListView.register != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => RegisterOtpListView(),
            builder: (context, child) => VerificationScreen(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        ),
      );
    } else {
      _button = false;
    }

    setState(() {
      visible = false;
    });
  }

  @override
  void initState() {
    super.initState();
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
                            text: "Sign Up",
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
                                "Yuk, mulai berinvestasi dengan cara yang mudah",
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
                      obscure: false,
                      onChanges: (val) => setState(
                        () {
                          if (EmailValidator.validate(emailController.text)) {
                            _emailValid = true;
                            if (_passValid &&
                                _passConfirmValid &&
                                passwordConfirmController.text != "") {
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
                      hintText: "*****",
                      isPassword: true,
                      obscure: passSecure,
                      onTap: () => setState(() => passSecure = !passSecure),
                      onChanges: (val) => setState(() {
                        if (val.length > 5) {
                          _passValid = true;
                          if (val != passwordConfirmController.text) {
                            if (passwordConfirmController.text != "") {
                              _passConfirmValid = false;
                            }
                            _button = false;
                          } else {
                            _passConfirmValid = true;
                            if (_emailValid && emailController.text != "") {
                              _button = true;
                            }
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
                    TextFieldRounded(
                      controller: passwordConfirmController..text,
                      labelText: "Konfirmasi Kata sandi",
                      hintText: "*****",
                      isPassword: true,
                      obscure: passConfirmSecure,
                      onTap: () => setState(
                          () => passConfirmSecure = !passConfirmSecure),
                      onChanges: (val) => setState(() {
                        if (val.length > 5) {
                          if (val == passwordController.text) {
                            _passConfirmValid = true;
                            _passValid = true;

                            if (_emailValid && emailController.text != "") {
                              _button = true;
                            }
                          } else {
                            _passConfirmValid = false;
                            _button = false;
                          }
                        } else {
                          _passConfirmValid = false;
                          _button = false;
                        }
                      }),
                      validation: !_passConfirmValid
                          ? Text(
                              "Kata sandi tidak sama",
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
                      child: _button
                          ? ButtonRounded(
                              text: "Daftar",
                              onPresses: () => _doRegister(context),
                            )
                          : ButtonRoundedDisabled(
                              text: "Daftar",
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          BRIText(
                            text: "Sudah memiliki akun? ",
                            size: 12,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (context) => LoginListView(),
                                  builder: (context, child) => LoginScreen(),
                                ),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: PRIMARY,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
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
}
