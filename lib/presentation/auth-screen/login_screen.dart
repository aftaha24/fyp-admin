import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traceebee_admin_app/presentation/home-screen/home_screen.dart';
import 'package:traceebee_admin_app/presentation/widgets/custom_textfield.dart';
import 'package:traceebee_admin_app/utlis/colors.dart';
import 'package:traceebee_admin_app/utlis/text_styles.dart';
import 'package:traceebee_admin_app/utlis/utility.dart';

import '../../services/firebase_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordController;
  late TextEditingController emailController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  bool validate() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      showSnackBar(context, text: 'Please fill all fields');
      return false;
    } else {
      return true;
    }
  }

  void login() async {
    if (validate()) {
      setState(() => isLoading = true);

      var res = await FirebaseAuthService().login(
          email: emailController.text, password: passwordController.text);

      if (res == 'success') {
        setState(() => isLoading = false);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      } else {
        setState(() => isLoading = false);
        // ignore: use_build_context_synchronously
        showSnackBar(context, text: res);
      }
    }
  }

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
                  CustomTextfield(
                    hintText: 'Enter your email',
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextfield(
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isObscure: true,
                    // obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            InkWell(
              onTap: () => login(),
              child: Container(
                height: 40.h,
                width: 320.w,
                color: darkgreenColor,
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
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
