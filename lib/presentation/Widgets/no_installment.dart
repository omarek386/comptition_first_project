import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/given.dart';

class NotHaveInstallmentWidget extends StatelessWidget {
  const NotHaveInstallmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ليس لديك اي قسط بعد',
          style: TextStyle(
            color: kPrimaryColor3,
            fontSize: 20.sp,
            fontFamily: kfontStyle3,
          ),
        ),
        SizedBox(
          // height: 600.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/no_quest.gif',
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
