import 'package:brinvestyuk/models/onboarding_model.dart';
import 'package:brinvestyuk/view_models/onboarding_view_model.dart';
import 'package:flutter/material.dart';

class OnBoardingListViewModel with ChangeNotifier {
  List<OnBoardingViewModel> onBoardings = <OnBoardingViewModel>[];

  void onBoard() async {
    List<OnBoardingModel> items = <OnBoardingModel>[
      OnBoardingModel(
        title: "Timbang Risiko-Nya, Dapatkan Keuntungan-Nya",
        subtitle:
            "Di BRInvestYuk Kamu Bisa Atur Keuntungannya Dengan Risiko Yang Terukur",
        image: "assets/images/onboard/onboard_1.png",
      ),
      OnBoardingModel(
        title: "Tentukan Arah ®Investasimu",
        subtitle:
            "Mau Lari Kencang Bisa, Mau Jalan Santai Bisa, Yang Penting Kamu Bisa Untung Terus",
        image: "assets/images/onboard/onboard_2.png",
      ),
      OnBoardingModel(
        title: "Modalmu itu Ibarat Bibit Unggul",
        subtitle:
            "Kami sediakan media tanamnya, dirawat dengan baik, selanjutnya jadi Bukit.",
        image: "assets/images/onboard/onboard_3.png",
      ),
    ];

    this.onBoardings =
        items.map((val) => OnBoardingViewModel(onboard: val)).toList();
  }
}
