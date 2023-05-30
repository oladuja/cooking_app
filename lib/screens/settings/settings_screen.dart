import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_color.dart';
import '../home/notifications_screen.dart';
import '../home/side_menu.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting-screen';

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool pushNotificationValue = false;
  bool emailNotificationValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                'assets/images/menu.png',
                width: 21.w,
                height: 16.h,
              ),
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(NotificationScreen.routeName),
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      drawer: const SideMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10).h,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColor.containerColor,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/language.png',
                      width: 21.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 8.w),
                    const Text('Language'),
                    const Spacer(),
                    const Text(
                      'English',
                      style: TextStyle(
                        color: AppColor.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppColor.lightTextColor),
              Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10).h,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8.0,
                ),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColor.containerColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.notifications_outlined),
                        SizedBox(width: 8.w),
                        const Text('Push Notifications'),
                        const Spacer(),
                        Switch.adaptive(
                            value: pushNotificationValue,
                            onChanged: (value) {
                              setState(() {
                                pushNotificationValue = value;
                              });
                            },
                            activeColor: AppColor.mainColor,
                            ),
                      ],
                    ),
                    const Divider(color: AppColor.lightTextColor),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        SizedBox(width: 8.w),
                        const Text('Email Notifications'),
                        const Spacer(),
                           Switch.adaptive(
                            value: emailNotificationValue,
                            onChanged: (value) {
                              setState(() {
                                emailNotificationValue = value;
                              });
                            },
                            activeColor: AppColor.mainColor,
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
