import 'package:brinvestyuk/models/onboarding_model.dart';

class OnBoardingViewModel {
  OnBoardingModel onBoarding;

  OnBoardingViewModel({required OnBoardingModel onboard})
      : onBoarding = onboard;

  String get title {
    return onBoarding.title;
  }

  String get subtitle {
    return onBoarding.subtitle;
  }

  String get image {
    return onBoarding.image;
  }
}
