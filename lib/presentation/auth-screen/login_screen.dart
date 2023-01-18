import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: SingleChildScrollView(
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
                child: Text(
                  "TRACEBEE",
                  style: headingStyle,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Welcome Back!",
              style: headingStyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Please enter your information to login",
              style: subHeadingStyle,
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              "assets/images/login_welcome_image.png",
              height: 150.h,
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const CustomTextfield(
                    hintText: 'Enter your email',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const CustomTextfield(
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
              child: Container(
                height: 40.h,
                width: 320.w,
                color: darkgreenColor,
                child: Center(
                  child: Text(
                    "Login",
                    style: headingStyle.copyWith(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
