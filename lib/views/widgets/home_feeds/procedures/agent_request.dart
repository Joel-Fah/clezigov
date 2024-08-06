import 'package:clezigov/utils/constants.dart';
import 'package:clezigov/utils/utility_functions.dart';
import 'package:clezigov/views/widgets/buttons/primary_button.dart';
import 'package:clezigov/views/widgets/loading_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  static const routeName = "/agent-request";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent request"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            children: [
              SvgPicture.asset(agentRequest),
              Gap(16.0),
              Text(
                "Request an agent for physical\nassistance in the procedure",
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              Gap(8.0),
              Text(
                "Feeling tired and bored? It is therefore high time to request for an agent that will handle your procedures tasks for you and get your the final documents in hand, wherever you are.",
                style: AppTextStyles.body.copyWith(
                  color: disabledColor,
                ),
              ),
              Gap(16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedAgreement02,
                    color: seedColor,
                  ),
                  Gap(8.0),
                  Expanded(
                    child: Text(
                      "Meet with an agent at a place around you and get to know each other.",
                      style: AppTextStyles.body,
                    ),
                  )
                ],
              ),
              Gap(16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedFileLocked,
                    color: seedColor,
                  ),
                  Gap(8.0),
                  Expanded(
                    child: Text(
                      "Once we are in possession of your documents, they remain safe and confidential. We value your privacy.",
                      style: AppTextStyles.body,
                    ),
                  )
                ],
              ),
              Gap(16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedHourglass,
                    color: seedColor,
                  ),
                  Gap(8.0),
                  Expanded(
                    child: Text(
                      "We aim at completing your procedures within the most brief delays.",
                      style: AppTextStyles.body,
                    ),
                  )
                ],
              ),
              Gap(16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    HugeIcons.strokeRoundedPackageDelivered,
                    color: seedColor,
                  ),
                  Gap(8.0),
                  Expanded(
                    child: Text(
                      "And get your final documents delivered back to you, ready to complete their journey.",
                      style: AppTextStyles.body,
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: PrimaryButton.child(
              onPressed: () {},
              height: 56.0,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Request an agent",
                      style: AppTextStyles.body.copyWith(color: scaffoldBgColor),
                    ),
                    Gap(8.0),
                    VerticalDivider(
                      color: scaffoldBgColor,
                    ),
                    Gap(8.0),
                    FutureBuilder(
                      future: Future.delayed(duration * 5, () {
                        return "3500";
                      },),
                      builder: (context, snapshot) {
                        final data = snapshot.data;

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SizedBox(
                            width: 110,
                            child: LoadingBuilder(
                              primaryColor: seedColorPalette.shade100,
                              secondaryColor: Colors.white.withOpacity(0.3),
                            ),
                          );
                        }

                        return Animate(
                          effects: [FadeEffect(), MoveEffect(begin: Offset(-10, 0), end: Offset(10, 0))],
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                                borderRadius: borderRadius * 2,
                                color: scaffoldBgColor,
                                boxShadow: [shadow]
                            ),
                            child: Text("${addThousandSeparator(data!)} FCFA"),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}