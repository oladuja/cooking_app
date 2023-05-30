import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ResizeImage(AssetImage('assets/images/bg.png'),
              width: 1080, height: 2148),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.65),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
