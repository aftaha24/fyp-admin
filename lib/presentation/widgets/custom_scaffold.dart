import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:traceebee_admin_app/presentation/auth-screen/login_screen.dart';
import 'package:traceebee_admin_app/presentation/home-screen/about_us_screen.dart';
import 'package:traceebee_admin_app/presentation/home-screen/beekeepers_info_screen.dart';
import 'package:traceebee_admin_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_admin_app/presentation/home-screen/stingless_bee_info_screen.dart';
import 'package:traceebee_admin_app/providers/home-provider/home_provider.dart';
import 'package:traceebee_admin_app/services/local_shared_service.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeState, child) {
        return Scaffold(
          backgroundColor: greenColor,
          bottomNavigationBar: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            color: lightskinColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONTACT US",
                      style: headingStyle.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Jln. UIAM, 53100, Selangor, Malaysia",
                      style: subHeadingStyle.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
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
                                onTap: () {
                                  homeState.setMenuState();
                                },
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
                    body!,
                  ],
                ),
              ),
              homeState.menuState == MenuState.opened
                  ? Positioned(
                      top: 75.h,
                      right: 20.w,
                      child: Container(
                        height: 300.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      homeState.setMenuState();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      size: 40.w,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  homeState.setMenuStatetoClosed();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Home",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  homeState.setMenuStatetoClosed();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const StingLessBeeInfoScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "STINGLESS BEE HONEY",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  homeState.setMenuStatetoClosed();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const BeeKeepersInfoScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "BEEKEEPER’S INFO",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  homeState.setMenuStatetoClosed();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const AboutUsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "ABOUT",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  LocalService().removeSharedService();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "LOG OUT",
                                  style: headingStyle.copyWith(fontSize: 20.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
