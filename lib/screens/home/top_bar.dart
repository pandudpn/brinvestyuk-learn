import 'package:brinvestyuk/constant/constant.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  final String? name;
  final Size size;

  const TopBar({
    Key? key,
    this.name,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BRInvestYuk!",
                  style: TextStyle(
                    fontFamily: "CartoonMarker",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    letterSpacing: 1.5,
                    shadows: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 0,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                  onTap: () => print("pencet lonceng"),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(defaultPadding - 5),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 10),
                  blurRadius: 20,
                  color: Color(0xFF000000).withOpacity(0.3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    name != null ? name!.substring(0, 1) : "I",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  radius: 30,
                ),
                Container(
                  width: size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BRIText(
                        text: name ?? "Investor",
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      BRIText(
                        text: "Ranking 10/100",
                        size: 13,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => print("di pencet banner"),
                  child: SvgPicture.asset("assets/images/medal.svg"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
