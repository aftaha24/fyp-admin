import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.desc,
      required this.color});
  final String image;
  final String title;
  final String desc;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 180.w,
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 70.h,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: headingStyle.copyWith(
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              desc,
              style: subHeadingStyle.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
