import 'package:clezigov/controllers/procedures_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../models/procedures/contact.dart';
import '../../../../models/procedures/procedures.dart';
import '../../../../utils/constants.dart';
import '../../tilt_icon.dart';

class ProceduresContactsList extends StatefulWidget {
  const ProceduresContactsList({
    super.key,
    required this.procedureId,
  });

  final String procedureId;

  @override
  State<ProceduresContactsList> createState() => _ProceduresContactsListState();
}

class _ProceduresContactsListState extends State<ProceduresContactsList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    "Phone(s)",
    "Email(s)",
    "Address(es)",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Procedure procedure =
        Get.find<ProceduresController>().getProcedureById(widget.procedureId);

    return Column(
      children: [
        TiltIcon(
          icon: HugeIcons.strokeRoundedCustomerService01,
        ),
        Gap(8.0),
        Text(
          "Get in touch with the\ncustomer support",
          style: AppTextStyles.h2,
          textAlign: TextAlign.center,
        ),
        Gap(8.0),
        TabBar(
          controller: _tabController,
          splashBorderRadius: borderRadius * 2,
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return seedColorPalette.shade50.withOpacity(0.5);
            }
            return Colors.transparent;
          }),
          labelStyle: AppTextStyles.small.copyWith(
            color: seedColor,
          ),
          unselectedLabelColor: disabledColor,
          indicator: BoxDecoration(
            borderRadius: borderRadius * 2,
            color: seedColorPalette.shade50,
          ),
          tabs: _tabs
              .map(
                (tab) => Tab(
                  text: tab,
                  height: 32.0,
                ),
              )
              .toList(),
        ),
        Gap(8.0),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0,),
                shrinkWrap: true,
                itemCount: procedure.contacts.length,
                separatorBuilder: (context, index) => Gap(8.0),
                itemBuilder: (context, index) {
                  final Contact contact = procedure.contacts[index];

                  final callingNumbers = procedure.contacts
                      .expand((contact) => contact.phoneNumbers)
                      .where((number) => number.isCalling)
                      .toList();

                  final messageNumbers = procedure.contacts
                      .expand((contact) => contact.phoneNumbers)
                      .where((number) => number.isMessaging)
                      .toList();

                  final whatsappNumbers = procedure.contacts
                      .expand((contact) => contact.phoneNumbers)
                      .where((number) => number.isWhatsapp)
                      .toList();

                  return ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contact.phoneNumbers.length,
                    separatorBuilder: (context, index) => Gap(8.0),
                    itemBuilder: (context, index) {
                      final phoneNumber = contact.phoneNumbers[index];
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: borderRadius * 2.75,
                          boxShadow: [shadow],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                phoneNumber.phoneNumber,
                                style: AppTextStyles.body,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (callingNumbers
                                    .contains(phoneNumber))
                                  IconButton(
                                    tooltip: "Call",
                                    icon: Icon(
                                      HugeIcons.strokeRoundedCall02,
                                      color: seedColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                if (messageNumbers
                                    .contains(phoneNumber))
                                  IconButton(
                                    tooltip: "Chat",
                                    icon: Icon(
                                      HugeIcons.strokeRoundedComment01,
                                      color: seedColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                if (whatsappNumbers
                                    .contains(phoneNumber))
                                  IconButton(
                                    tooltip: "WhatsApp",
                                    icon: Icon(
                                      HugeIcons.strokeRoundedWhatsapp,
                                      color: seedColor,
                                    ),
                                    onPressed: () {},
                                  ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0,),
                itemCount: procedure.contacts.length,
                separatorBuilder: (context, index) => Gap(8.0),
                itemBuilder: (context, index) {
                  final Contact contact = procedure.contacts[index];

                  return Visibility(
                    visible: contact.email.isNotEmpty,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadius * 2.75,
                        boxShadow: [shadow],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            contact.email,
                            style: AppTextStyles.body,
                          ),
                          IconButton(
                            tooltip: "Email",
                            icon: Icon(
                              HugeIcons.strokeRoundedMailSend01,
                              color: seedColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0,),
                itemCount: procedure.contacts.length,
                separatorBuilder: (context, index) => Gap(8.0),
                itemBuilder: (context, index) {
                  final Contact contact = procedure.contacts[index];

                  return Visibility(
                    visible: contact.address!.isNotEmpty,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: borderRadius * 2.75,
                        boxShadow: [shadow],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            contact.address!,
                            style: AppTextStyles.body,
                          ),
                          IconButton(
                            tooltip: "Copy address",
                            icon: Icon(
                              HugeIcons.strokeRoundedCopy01,
                              color: seedColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
