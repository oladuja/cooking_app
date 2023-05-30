import 'package:cooking_app/providers/side_menu_state.dart';
import 'package:cooking_app/screens/home/recently_viewed_screen.dart';
import 'package:cooking_app/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'helpers/app_color.dart';
import 'helpers/password_visibility.dart';
import 'providers/recipes.dart';
import 'screens/home/detail_screen.dart';
import 'screens/home/favourite_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/notifications_screen.dart';
import 'screens/splash/register_screen.dart';
import 'screens/splash/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() => runApp(const CookingApp());

class CookingApp extends StatelessWidget {
  const CookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PasswordVisibility(),
        ),
        ChangeNotifierProvider(
          create: (_) => Recipes(),
        ),
        ChangeNotifierProvider(
          create: (_) => SideMenuState(),
        ),
      ],
      builder: (context, child) => ScreenUtilInit(
        designSize: Size(deviceSize.width, deviceSize.height),
        builder: (_, child) => MaterialApp(
          theme: ThemeData(
            fontFamily: 'Hellix',
            primaryColor: AppColor.mainColor,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: AppColor.mainColor),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Cooking App',
          initialRoute: SplashScreen.routeName,
          routes: {
            RecentlyViewedScreen.routeName: (_) => const RecentlyViewedScreen(),
            SettingScreen.routeName: (_) => const SettingScreen(),
            NotificationScreen.routeName: (_) => const NotificationScreen(),
            FavouriteScreen.routeName: (_) => const FavouriteScreen(),
            DetailScreen.routeName: (_) => const DetailScreen(),
            SplashScreen.routeName: (_) => const SplashScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            RegisterScreen.routeName: (_) => RegisterScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
          },
        ),
      ),
    );
  }
}
