import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_education/models/topic.dart';
import 'package:crypto_education/utils/app_colors.dart';
import 'package:crypto_education/utils/app_icons.dart';
import 'package:crypto_education/utils/app_texts.dart';
import 'package:crypto_education/utils/custom_svg.dart';
import 'package:crypto_education/views/base/video_card.dart';
import 'package:crypto_education/views/screens/playlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/courses_model.dart';
import '../screens/home/category_list.dart';

class CourseList extends StatelessWidget {
  final CourseModel courses;
  const CourseList(this.courses, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CategoryList( course: courses));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.gray.shade800,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: courses.thumbnail,
                fadeInDuration: Duration(),
                fadeOutDuration: Duration(),
                height: 68,
                width: 104,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courses.name, style: AppTexts.tmds),
                ],
              ),
            ),
            CustomSvg(asset: AppIcons.navArrowRight),
          ],
        ),
      ),
    );
  }
}
