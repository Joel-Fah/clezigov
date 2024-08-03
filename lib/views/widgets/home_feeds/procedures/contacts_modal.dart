import 'package:clezigov/views/widgets/home_feeds/procedures/procedures_contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../models/procedures/procedures.dart';
import '../../../../utils/constants.dart';

void showContactsModal(BuildContext context, Procedure procedure) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: mediaHeight(context) / 1.5),
    builder: (context) {
      return Stack(
        children: [
          ProceduresContactsList(
            procedureId: procedure.id,
          ),
          Positioned(
            top: -10.0,
            right: 10.0,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                HugeIcons.strokeRoundedCancel01,
              ),
            ),
          ),
        ],
      );
    },
  );
}
