import '../utils/constants.dart';

class OnboardingData {
  final String title;
  final String image;

  OnboardingData({
    required this.title,
    required this.image,
  });
}

final List<OnboardingData> onboardingData = [
  OnboardingData(
    title: 'Again bored of facing another important administrative procedure?',
    image: onboardImg1,
  ),
  OnboardingData(
    title: 'Well, worry less now because clezigov makes it now clear and easy for you.',
    image: onboardImg2,
  ),
  OnboardingData(
    title: 'There are a bunch of “How to?”s we have answered to ease your procedures.',
    image: onboardImg3,
  ),
];