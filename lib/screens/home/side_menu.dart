import 'package:cooking_app/helpers/app_color.dart';
import 'package:cooking_app/providers/side_menu_state.dart';
import 'package:cooking_app/screens/home/recently_viewed_screen.dart';
import 'package:cooking_app/screens/splash/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/side_menu_drawer_item.dart';
import '../settings/settings_screen.dart';
import 'favourite_screen.dart';
import 'home_screen.dart';

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({
    super.key,
  });

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  @override
  Widget build(BuildContext context) {
    SideMenuState sideMenuState = Provider.of<SideMenuState>(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                left: 30,
                right: 30,
                bottom: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.h,
                  backgroundImage:
                      const AssetImage('assets/images/Ellipse 3.png'),
                ),
                SizedBox(width: 6.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emm********.com',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'view profile',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.lightTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SideMenuDrawerItem(
            image: 'assets/images/home.png',
            title: 'Home',
            isSelected: sideMenuState.index == 0,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(0);
              });
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/like.png',
            title: 'Favourites',
            isSelected: sideMenuState.index == 1,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(1);
              });
              Navigator.of(context)
                  .pushReplacementNamed(FavouriteScreen.routeName);
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/play.png',
            title: 'Recently Viewed',
            isSelected: sideMenuState.index == 2,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(2);
              });
              Navigator.of(context)
                  .pushReplacementNamed(RecentlyViewedScreen.routeName);
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/settings.png',
            title: 'Settings',
            isSelected: sideMenuState.index == 3,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(3);
              });
              Navigator.of(context)
                  .pushReplacementNamed(SettingScreen.routeName);
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/info.png',
            title: 'About Us',
            isSelected: sideMenuState.index == 4,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(4);
              });
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/help.png',
            title: 'Help',
            isSelected: sideMenuState.index == 5,
            onTap: () {
              setState(() {
                sideMenuState.changeIndex(5);
              });
            },
          ),
          SideMenuDrawerItem(
            image: 'assets/images/sign_out.png',
            title: 'Sign Out',
            isSelected: sideMenuState.index == 6,
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RegisterScreen.routeName, (route) => true);
            },
          ),
        ],
      ),
    );
  }
}
