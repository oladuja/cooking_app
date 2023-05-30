import 'package:cooking_app/helpers/app_color.dart';
import 'package:cooking_app/screens/home/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/notifcation_item.dart';
import '../../widgets/search_and_filter_button.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = 'notification-screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuDrawer(),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifactions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'Mark all as read',
                    style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SearchAndFilterButton(
                hintText: 'Search Using keywords',
                onTap: () {},
              ),
              ...List<Widget>.generate(
                15,
                (index) => NotifcationItem(
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
