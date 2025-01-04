import 'dart:developer';

import 'package:comptition_first_project/Helper/Database/database_helper.dart';
import 'package:comptition_first_project/Models/Installment_model.dart';
import 'package:comptition_first_project/presentation/Widgets/data_of_table_widget.dart';
import 'package:comptition_first_project/presentation/Widgets/my_bot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helper/spacing.dart';
import '../../constants/given.dart';
import '../Widgets/no_installment.dart';

// ignore: must_be_immutable
class InstallmentsScreen extends StatefulWidget {
  InstallmentsScreen({super.key, required this.installments});
  List installments;

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController deadTimeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ميزان',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.sp,
            fontFamily: kfontStyle4,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myShowDialog(context);
        },
        backgroundColor: kPrimaryColor3,
        child: const Icon(Icons.add),
      ),
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyBotWidget(
                    text:
                        'في هذة الصفحة يتم عرض او اضافه او حذف الاقساط الملتزم بها حاليا'),
                verticalSpace(20),
                widget.installments.isEmpty
                    ? const NotHaveInstallmentWidget()
                    : Expanded(
                        child: DataOfTableWidget(
                            installments: widget.installments)),
              ]),
        ),
      ),
    );
  }

  Future<dynamic> myShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          var textStyle1 = TextStyle(
              color: Colors.black, fontSize: 15.sp, fontFamily: kfontStyle3);
          return AlertDialog(
            title: const Text(
              'اضافة قسط جديد',
              style: TextStyle(color: Colors.black, fontFamily: kfontStyle1),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: monthlyInstallmentController,
                    decoration: const InputDecoration(
                      labelText: 'القسط',
                      hintText: 'القسط',
                    ),
                  ),
                  TextField(
                    controller: deadTimeController,
                    decoration: const InputDecoration(
                      labelText: 'الميعاد',
                      hintText: 'الميعاد',
                    ),
                  ),
                  TextField(
                    controller: notesController,
                    decoration: const InputDecoration(
                      labelText: 'ملاحظات',
                      hintText: 'ملاحظات',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'الغاء',
                  style: textStyle1,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kPrimaryColor3,
                ),
                onPressed: () async {
                  await DatabaseHelper.instance.addNote(
                    InstallmentModel(
                      monthlyInstallment: monthlyInstallmentController.text,
                      deadTime: deadTimeController.text,
                      note: notesController.text,
                    ),
                  );
                  await getList();
                  setState(() {
                    monthlyInstallmentController.clear();
                    deadTimeController.clear();
                    notesController.clear();
                  });
                  log(widget.installments.toString());
                  Navigator.pop(context);
                },
                child: Text('اضافة', style: textStyle1),
              ),
            ],
          );
        });
  }

  Future<void> getList() async {
    widget.installments = await DatabaseHelper.instance.getNoteList();
  }
}
