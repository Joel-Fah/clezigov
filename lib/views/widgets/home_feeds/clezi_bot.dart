import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CleziBot extends StatelessWidget {
  const CleziBot({
    super.key,
  });
  static const String routeName = '/clezi';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Clezi",
        style: AppTextStyles.h1.copyWith(
          fontFamily: nohemiFont,
        ),
      ),
    );
  }
}