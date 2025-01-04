import 'package:comptition_first_project/Extensions/device_size.dart';
import 'package:comptition_first_project/constants/given.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBotWidget extends StatelessWidget {
  final String text;
  const MyBotWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: context.deviceWidth,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 10,
            top: -10,
            child: ClipOval(
              child: Image(
                width: 50.w,
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/logo (2).png",
                ),
              ),
            ),
          ),
          Positioned(
            right: 60.h,
            bottom: 0,
            child: Container(
              width: context.deviceWidth - 90.w,
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: kPrimaryColor2,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r))),
              child: Text(text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: kfontStyle2)),
            ),
          ),
        ],
      ),
    );
  }
}
