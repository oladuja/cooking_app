import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_color.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/background_widget.dart';
import 'sign_in_screen.dart';
import 'register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
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
              SizedBox(height: 15.h),
              Text(
                'Cooking Done The Easy Way',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              AppButton(
                title: 'Register',
                onPressed: () =>
                    Navigator.of(context).pushNamed(RegisterScreen.routeName),
              ),
              SizedBox(height: 5.h),
              AppTextButton(
                text: 'Sign In',
                onPressed: () =>
                    Navigator.of(context).pushNamed(LoginScreen.routeName),
                color: AppColor.mainColor,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
