import 'package:clezigov/models/procedures/procedures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/utility_functions.dart';
import '../../../screens/home/procedure_details.dart';
import '../../loading_builder.dart';
import '../procedures_feed.dart';

class SearchProceduresDelegate extends SearchDelegate<String> {
  final List<Procedure> procedures;
  final searchController = TextEditingController();

  SearchProceduresDelegate({required this.procedures});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              tooltip: "Clear",
              onPressed: () {
                query = '';
              },
              icon: const Icon(
                HugeIcons.strokeRoundedCancel01,
                color: darkColor,
              ),
            )
          : IconButton(
              tooltip: "Categories",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  constraints: BoxConstraints(
                    maxHeight: mediaHeight(context) / 1.5,
                  ),
                  builder: (context) {
                    return Stack(
                      children: [
                        CategoriesList(searchController: searchController),
                        Positioned(
                          top: -10.0,
                          right: 10.0,
                          child: IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(HugeIcons.strokeRoundedCancel01),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                HugeIcons.strokeRoundedGeometricShapes01,
                color: seedColor,
              ),
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(
        HugeIcons.strokeRoundedArrowLeft02,
        color: darkColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // final results = procedures.where((procedure) {
    //   return procedure.title.toLowerCase().contains(query.toLowerCase());
    // }).toList();

    Future<List> results = Future.delayed(duration * 6, () {
      return procedures.where((procedure) {
        return procedure.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });

    return FutureBuilder(
      future: results,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Animate(
            effects: [FadeEffect(), MoveEffect()],
            child: Center(child: LoadingBuilder()),
          );
        }

        if (snapshot.data!.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Animate(
                    effects: [FadeEffect(), MoveEffect()],
                    child: SvgPicture.asset(emptyQuery),
                  ),
                  Gap(8.0),
                  Text.rich(
                    TextSpan(
                      text: "No results found for \n\n`` ",
                      children: [
                        TextSpan(
                            text: "$query",
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        const TextSpan(text: " ``"),
                      ],
                    ),
                    style: AppTextStyles.body.copyWith(color: disabledColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
            ),
            itemBuilder: (context, index) {
              final procedure = snapshot.data![index];
              return ListTile(
                title: Text(
                  procedure.title,
                  style: AppTextStyles.body,
                ),
                trailing: Icon(
                  HugeIcons.strokeRoundedArrowUpRight01,
                  color: disabledColor,
                ),
                onTap: () {
                  query = procedure.title;

                  Future.delayed(const Duration(milliseconds: 500), () {
                    context.pushNamed(
                      removeBeginningSlash(ProcedureDetailsPage.routeName),
                      pathParameters: {'id': procedure.id},
                    );
                  });
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = procedures.where((procedure) {
      return procedure.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return ListTile(
        title: Text.rich(
          TextSpan(
            text: "Search for ",
            children: [
              TextSpan(
                text: "$query",
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: AppTextStyles.body,
        ),
        trailing: Icon(
          HugeIcons.strokeRoundedArrowUpRight01,
          color: disabledColor,
        ),
        onTap: () {
          // Future.delayed(duration, () {
          //   context.pushNamed(
          //     removeBeginningSlash(ProcedureDetailsPage.routeName),
          //     pathParameters: {'id': procedure.id},
          //   );
          // });
        },
      );
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ListView.separated(
        itemCount: results.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const Divider(
            height: 1,
          ),
        ),
        itemBuilder: (context, index) {
          final procedure = results[index];
          return ListTile(
            title: Text(
              procedure.title,
              style: AppTextStyles.body,
            ),
            trailing: Icon(
              HugeIcons.strokeRoundedArrowUpRight01,
              color: disabledColor,
            ),
            onTap: () {
              query = procedure.title;

              // Future.delayed(duration, () {
              //   context.pushNamed(
              //     removeBeginningSlash(ProcedureDetailsPage.routeName),
              //     pathParameters: {'id': procedure.id},
              //   );
              // });
            },
          );
        },
      ),
    );
  }
}
