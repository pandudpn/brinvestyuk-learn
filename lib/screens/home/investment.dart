import 'package:brinvestyuk/constant/color.dart';
import 'package:brinvestyuk/constant/constant.dart';
import 'package:brinvestyuk/widgets/text.dart';
import 'package:flutter/material.dart';

class Investment extends StatelessWidget {
  final Size size;
  final String? total;
  final String? profitToday;
  final String? profit;

  const Investment({
    Key? key,
    required this.size,
    this.total,
    this.profit,
    this.profitToday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BRIText(
                text: "Total Investasi",
                size: 12,
              ),
              GestureDetector(
                  onTap: () => print("lihat transaksi"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Lihat semua",
                        style: TextStyle(
                          color: PRIMARY,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: PRIMARY,
                        size: 18,
                      )
                    ],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultPadding - 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BRIText(
                  text: total ?? "Rp 0",
                  size: 22,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BRIText(
                  text: "Keuntungan hari ini",
                  size: 12,
                ),
                BRIText(
                  text: "Total keuntungan",
                  size: 12,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BRIText(
                  text: profitToday ?? "Rp 0",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
                BRIText(
                  text: profit ?? "Rp 0",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton(
              onPressed: () => print("cobain"),
              child: Text(
                "+ Cobain Investasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "CartoonMarker",
                  letterSpacing: .5,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(PRIMARY),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                    vertical: defaultPadding * 0.6,
                    horizontal: defaultPadding * 4,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
