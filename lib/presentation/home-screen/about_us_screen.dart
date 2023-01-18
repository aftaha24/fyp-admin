import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Container(
            height: 600.h,
            width: MediaQuery.of(context).size.width,
            color: lightgreenColor,
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "ABOUT US",
                  style: headingStyle,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 280.w,
                  child: Text(
                    "Our people are at the core of what makes TraceBee such a unique place to work. We’re proud of the diversity of our staff, since each member has unique skills they bring to each project. Together, we’ve experienced the planning and implementation process of some of the most innovative digital experiences for beloved clients across several industries. Find out more about some of our team members below.",
                    style: subHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "CONTACT INFO",
                  style: headingStyle.copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "TRACEBEE TEAM",
                  style: subHeadingStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Jln. UIAM, 53100, Selangor, Malaysia",
                  style: subHeadingStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "01139994201  || 0182823381",
                  style: subHeadingStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
