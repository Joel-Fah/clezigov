import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: AppTextStyles.h1.copyWith(
          fontFamily: nohemiFont,
        ),
      ),
    );
  }
}