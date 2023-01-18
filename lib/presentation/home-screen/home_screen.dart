import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_info_container.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/home_image.png"),
              Positioned(
                top: 10.h,
                left: 20.w,
                child: Container(
                  height: 180.h,
                  width: 200.w,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "TRACKING HONEY BY TRACEBEE",
                        style: headingStyle.copyWith(
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "TRACEBEE is a web application that offers efficient, timely, and user-friendly monitoring solutions with the goal of reshaping the beekeeping industry. Additionally, TRACEBEE is a platform for tracking the quantity of honey that is taken from the hives.",
                        style: subHeadingStyle.copyWith(fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CustomInfoContainer(
                image: "assets/images/home_image.png",
                title: "STINGLESS BEE HONEY",
                desc: "Information of honey from stingless Bess.",
                color: Color(0xff595791),
              ),
              CustomInfoContainer(
                image: "assets/images/info.png",
                title: "ABOUT US",
                desc: "Information about TraceBee Webapp",
                color: Color(0xff68CE58),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            child: Container(
              height: 155.h,
              width: 340.w,
              color: const Color(0xff6CC5CB),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/info-2.png',
                      height: 140.h,
                      width: 140.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            "BEEKEEPER’S INFO",
                            style: headingStyle.copyWith(fontSize: 18.sp),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            "Information of all Beekeepers that registered in the application will be registered under this section.",
                            style: subHeadingStyle.copyWith(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
