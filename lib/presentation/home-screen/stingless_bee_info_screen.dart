import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_scaffold.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class StingLessBeeInfoScreen extends StatelessWidget {
  const StingLessBeeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/stingless_bee.png"),
              Positioned(
                bottom: 10.h,
                left: 10.w,
                child: SizedBox(
                  height: 80.h,
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Stringless", style: headingStyle),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("BEE Honey", style: headingStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 350.h,
            width: MediaQuery.of(context).size.width,
            color: lightgreenColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What is Stingless Bee Honey (Madu Kelulut)?",
                    style: headingStyle.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Kelulut honey comes from stingless bees (Meliponines) that possess a unique behaviour of collecting nectar from multiple flowers and extrafloral nectaries.  Research has established that Kelulut honey has 10 times the amount of antioxidant properties compared to ordinary honey. Kelulut honey is known to have a broad spectrum of anti-biotic, anti-fungal activities, and is a potent anti-oxidant, anti-inflammatory agent.",
                    style: subHeadingStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Is stingless bee honey good for you?",
                    style: headingStyle.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Recent evidence indicates that stingless bee honey has many potential therapeutic benefits, including antibacterial qualities, anti-obesity impacts, and others. Stingless bee honey possesses several valuable properties under pathological conditions, rendering it a promising functional food that could be a reasonable dietary intervention to prevent or treat chronic subclinical systemic (CSSI) related diseases.",
                    style: subHeadingStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
