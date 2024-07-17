import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CommunityFeed extends StatelessWidget {
  const CommunityFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Community",
        style: AppTextStyles.h1.copyWith(
          fontFamily: nohemiFont,
        ),
      ),
    );
  }
}