import 'package:comptition_first_project/Extensions/device_size.dart';
import 'package:comptition_first_project/Helper/Database/database_helper.dart';
import 'package:comptition_first_project/Routers/routes.dart';
import 'package:comptition_first_project/presentation/Widgets/my_bot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffef2e2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //SizedBox(width: 2000),
            Center(
                child: Text(
              "ميزان",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            )),
            const MyBotWidget(
              text: "اهلا بك في يا على",
            ),

            const SelectScreenButton(
              image: "assets/images/dolar.png",
              title: "حساب تحويل العملات الى الدولار",
            ),
            GestureDetector(
              onTap: () async {
                List notes = await DatabaseHelper.instance.getNoteList();
                Navigator.pushNamed(context, Routes.installmentsScreen,
                    arguments: notes);
              },
              child: const SelectScreenButton(
                image: "assets/images/aqsat.jpg",
                title: "عرض الاقساط ومواعيدها",
              ),
            ),
            const SelectScreenButton(
              image: "assets/images/masrouf.png",
              title: "تنظيم المصروفات بالنسبة لدخلك الشهرى",
            ),
            const SelectScreenButton(
              image: "assets/images/data.jpg",
              title: "البيانات الشخصية",
            ),
          ],
        ));
  }
}

class SelectScreenButton extends StatelessWidget {
  final String image;
  final String title;
  const SelectScreenButton({
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: context.deviceWidth,
      decoration: BoxDecoration(
          color: const Color(0xff708872),
          borderRadius: BorderRadius.circular(25.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200.w,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ),
          CircleAvatar(
            radius: 40.r,
            backgroundImage: AssetImage(
              image,
            ),
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
