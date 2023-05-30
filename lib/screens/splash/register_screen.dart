import 'package:cooking_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_color.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_text_field_password.dart';
import '../../widgets/background_widget.dart';
import '../home/home_screen.dart';
import 'sign_in_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register-screen';

  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
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
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                // const Spacer(),
                AppTextField(
                  controller: nameController,
                  icon: Icons.person_2_outlined,
                  hintText: 'Full Name',
                  keybardType: TextInputType.name,
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
                SizedBox(
                  height: 20.h,
                ),
                AppButton(
                  title: 'Register',
                  onPressed: () => Navigator.of(context)
                      .popAndPushNamed(HomeScreen.routeName),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Already registered?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    AppTextButton(
                      color: AppColor.mainColor,
                      text: 'Sign In',
                      onPressed: () => Navigator.of(context)
                          .popAndPushNamed(LoginScreen.routeName),
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
