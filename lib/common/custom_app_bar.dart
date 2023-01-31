import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

import '../utlis/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function()? onTap;
  const CustomAppBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: skinColor,
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        height: 70.h,
        width: MediaQuery.of(context).size.width,
        color: skinColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "TRACEBEE",
                  style: headingStyle,
                ),
                const Spacer(),
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.menu,
                    size: 40.w,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
