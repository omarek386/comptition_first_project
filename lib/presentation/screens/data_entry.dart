import 'dart:developer';

import 'package:comptition_first_project/Extensions/device_size.dart';
import 'package:comptition_first_project/Helper/Database/cache_helper.dart';
import 'package:comptition_first_project/Routers/routes.dart';
import 'package:comptition_first_project/constants/given.dart';
import 'package:comptition_first_project/constants/keys.dart';
import 'package:comptition_first_project/presentation/Widgets/my_drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataEntry extends StatefulWidget {
  const DataEntry({super.key});

  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController monthlyIncomeController = TextEditingController();

  TextEditingController monyBankController = TextEditingController();

  bool isName = false;

  bool isEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "ميزان",
              style: TextStyle(
                  color: Color(0xff070707),
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              child: Image(image: AssetImage("assets/images/login.gif")),
            ),
            SizedBox(
              width: context.deviceWidth * 0.99,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "الاسم الكامل",
                ),
              ),
            ),
            SizedBox(
              width: context.deviceWidth * 0.99,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "البريد الالكتروني",
                ),
              ),
            ),
            SizedBox(
              width: context.deviceWidth * 0.99,
              child: TextField(
                  keyboardType: TextInputType.number,
                  controller: monthlyIncomeController,
                  obscureText: isName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "الدخل الشهري",
                      suffix: IconButton(
                        icon: Icon(
                          isName ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isName = !isName;
                          });
                        },
                      ))),
            ),
            SizedBox(
              width: context.deviceWidth * 0.99,
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: isEmail,
                controller: monyBankController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "الرصيد في البنك",
                    suffix: IconButton(
                      icon: Icon(
                        isEmail ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isEmail = !isEmail;
                        });
                      },
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "اختر دولتك",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                MyDropDownList(
                  values: items1,
                  boxColor: kPrimaryColor,
                  dropdownColor: kPrimaryColor3,
                  textColor: Colors.black,
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () async {
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      monthlyIncomeController.text.isNotEmpty &&
                      selectedCountry != null &&
                      monyBankController.text.isNotEmpty) {
                    await CacheHelper.saveData(
                        key: nameKey, value: nameController.text);
                    await CacheHelper.saveData(
                        key: emailKey, value: emailController.text);
                    await CacheHelper.saveData(
                        key: monthlyProfitKey,
                        value: monthlyIncomeController.text);
                    await CacheHelper.saveData(
                        key: monyOnBankKey, value: monyBankController.text);
                    await CacheHelper.saveData(
                        key: countryKey, value: selectedCountry);
                    log('done');
                    Navigator.pushNamed(context, Routes.homeScreen);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("من فضلك ادخل جميع البيانات"),
                  ));
                },
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontFamily: kfontStyle1,
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
