import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_color.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_text_field_password.dart';
import '../../widgets/background_widget.dart';
import '../home/home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login-screen';

  LoginScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).w,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'Daily Recipe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 35.h),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                AppTextField(
                  controller: emailController,
                  icon: Icons.mail_outline_outlined,
                  hintText: 'Email Address',
                  keybardType: TextInputType.emailAddress,
                ),
                AppTextFieldPassword(
                  controller: passwordController,
                  icon: Icons.lock_outline_rounded,
                  hintText: 'Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    text: 'Forgot Password?',
                    onPressed: () {},
                    color: const Color(0XFF128FAE),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppButton(
                  title: 'Sign In',
                  onPressed: () => Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    AppTextButton(
                      text: 'Register',
                      onPressed: () => Navigator.of(context)
                          .popAndPushNamed(RegisterScreen.routeName),
                      color: AppColor.mainColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
