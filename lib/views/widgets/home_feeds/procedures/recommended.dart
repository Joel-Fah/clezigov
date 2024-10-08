import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:like_button/like_button.dart';

import '../../../../controllers/bookmarks_controller.dart';
import '../../../../controllers/procedures_controller.dart';
import '../../../../models/procedures/procedures.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utility_functions.dart';
import '../../../screens/home/procedure_details.dart';

class RecommendedProcedure extends StatelessWidget {
  const RecommendedProcedure({
    super.key,
    required this.procedureId,
  });

  final String procedureId;

  @override
  Widget build(BuildContext context) {
    Procedure procedure = Get.find<ProceduresController>().getProcedureById(procedureId);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            removeBeginningSlash(ProcedureDetailsPage.routeName),
            pathParameters: {'id': procedure.id},
          );
        },
        child: Container(
          padding: allPadding * 1.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: borderRadius * 2.75,
            boxShadow: [shadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: seedColorPalette.shade50,
                      borderRadius: borderRadius * 2,
                    ),
                    child: Text(
                      procedure.category.name,
                      style: AppTextStyles.small.copyWith(
                        color: seedColor,
                      ),
                    ),
                  ),
                  Text(
                    procedure.status.name == "active" ? "" : "deprecated",
                    style: AppTextStyles.small.copyWith(
                      color: procedure.status.name == "active"
                          ? Colors.transparent
                          : dangerColor,
                    ),
                  )
                ],
              ),
              Gap(8.0),
              Expanded(
                child: Text(
                  procedure.title,
                  style: AppTextStyles.h3,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                HugeIcons.strokeRoundedMoney03,
                                color: disabledColor,
                                size: 16.0,
                              ),
                              Gap(4.0),
                              Expanded(
                                child: Text(
                                  "${addThousandSeparator(procedure.price.toInt().toString())} F",
                                  style: AppTextStyles.small.copyWith(
                                    fontSize: 14.0,
                                    color: disabledColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(16.0),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                HugeIcons.strokeRoundedClock05,
                                color: disabledColor,
                                size: 16.0,
                              ),
                              Gap(4.0),
                              Expanded(
                                child: Text(
                                  "~${convertToReadableTime(procedure.estimatedTimeToComplete)}",
                                  style: AppTextStyles.small.copyWith(
                                    fontSize: 14.0,
                                    color: disabledColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(16.0),
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                HugeIcons.strokeRoundedDocumentAttachment,
                                color: disabledColor,
                                size: 16.0,
                              ),
                              Gap(4.0),
                              Text(
                                "x${procedure.documents.length}",
                                style: AppTextStyles.small.copyWith(
                                  fontSize: 14.0,
                                  color: disabledColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<BookmarksController>(builder: (bookmarksController) {
                    // count the number of occurrence of the procedure in the bookmarks
                    // and return the count
                    final count = bookmarksController.bookmarks
                        .where((element) => element.id == procedure.id)
                        .length;

                    final bool isBookmarked = bookmarksController.bookmarks
                        .contains(procedure);

                    return LikeButton(
                      onTap: (isLiked) {
                        if (isLiked) {
                          bookmarksController.removeBookmark(procedure);
                        } else {
                          bookmarksController.addBookmark(procedure);
                        }
                        return Future.value(!isLiked);
                      },
                      likeBuilder: (isLiked) {
                        return Icon(
                          HugeIcons.strokeRoundedBookmark02,
                          color: isLiked
                              ? warningColor
                              : darkColor,
                          size: 16,
                        );
                      },
                      isLiked: isBookmarked,
                      circleColor: CircleColor(
                        start: warningColor.withOpacity(0.16),
                        end: warningColor.withOpacity(0.16),
                      ),
                      countBuilder: (count, isLiked, text) {
                        return Text(
                          count.toString(),
                          style: AppTextStyles.body.copyWith(
                            color: isLiked
                                ? warningColor
                                : darkColor,
                          ),
                        );
                      },
                      countPostion: CountPostion.right,
                      likeCount: count > 0 ? count : null,
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
