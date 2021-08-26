import 'package:brinvestyuk/screens/explore_screen.dart';
import 'package:brinvestyuk/view_models/list_views/onboarding_list_view.dart';
import 'package:brinvestyuk/view_models/onboarding_view_model.dart';
import 'package:brinvestyuk/widgets/onboard/image.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:brinvestyuk/widgets/title.dart';
import 'package:brinvestyuk/constant/color.dart' as ConstantColor;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final prefs = SharedPreferences.getInstance();
  bool? firstInstall;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<OnBoardingListViewModel>(context, listen: false).onBoard();
  }

  @override
  Widget build(BuildContext context) {
    var listOnBoard =
        Provider.of<OnBoardingListViewModel>(context, listen: false);
    int totalPages = listOnBoard.onBoardings.length;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/onboard/onboard.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: _Page(listOnBoard.onBoardings),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _PageIndicator(totalPages),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _Page(List<OnBoardingViewModel> pages) {
    List<Widget> lists = [];

    for (int i = 0; i < pages.length; i++) {
      Widget page = Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: OnboardImage(
                image: pages[i].image,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: DefaultTitle(
                text: pages[i].title,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            BRIText(
              text: pages[i].subtitle,
              textAlign: TextAlign.center,
            ),
            i == pages.length - 1
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: Center(
                      child: TextButton(
                        onPressed: () => {
                          prefs.then(
                              (value) => {value.setBool("firstInstall", true)}),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExploreScreen()))
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          animationDuration: Duration(
                            seconds: 750,
                          ),
                        ),
                        child: Text(
                          "Lanjutkan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  )
                : Text('')
          ],
        ),
      );

      lists.add(page);
    }

    return lists;
  }

  List<Widget> _PageIndicator(int totalPages) {
    List<Widget> lists = [];

    for (int i = 0; i < totalPages; i++) {
      lists.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }

    return lists;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 7.0,
      width: isActive ? 22.0 : 7.0,
      decoration: BoxDecoration(
        color:
            isActive ? ConstantColor.SECONDARY : ConstantColor.SECONDARY_OP30,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
