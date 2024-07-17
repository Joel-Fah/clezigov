import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ProceduresFeed extends StatelessWidget {
  const ProceduresFeed({
    super.key,
  });
  static const String routeName = '/procedures';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Procedures",
        style: AppTextStyles.h1.copyWith(
          fontFamily: nohemiFont,
        ),
      ),
    );
  }
}
