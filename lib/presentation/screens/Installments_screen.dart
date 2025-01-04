import 'dart:developer';

import 'package:comptition_first_project/Extensions/device_size.dart';
import 'package:comptition_first_project/Helper/Database/database_helper.dart';
import 'package:comptition_first_project/Helper/spacing.dart';
import 'package:comptition_first_project/Models/Installment_model.dart';
import 'package:comptition_first_project/presentation/Widgets/data_of_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/given.dart';
import '../Widgets/no_installment.dart';

class InstallmentsScreen extends StatefulWidget {
  const InstallmentsScreen({super.key});

  @override
  State<InstallmentsScreen> createState() => _InstallmentsScreenState();
}

class _InstallmentsScreenState extends State<InstallmentsScreen> {
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController deadTimeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  late List installments;
  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myShowDialog(context);
        },
        backgroundColor: kPrimaryColor3,
        child: const Icon(Icons.add),
      ),
      backgroundColor: kPrimaryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(context.deviceHeight / 3),
            installments.isEmpty
                ? const NotHaveInstallmentWidget()
                : DataOfTableWidget(installments: installments),
          ]),
    );
  }

  Future<dynamic> myShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          var textStyle1 = TextStyle(
              color: Colors.black, fontSize: 15.sp, fontFamily: kfontStyle3);
          return AlertDialog(
            title: Text(
              'اضافة قسط جديد',
              style: TextStyle(color: Colors.black, fontFamily: kfontStyle1),
            ),
            content: Column(
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
                  log(installments.toString());
                  Navigator.pop(context);
                },
                child: Text('اضافة', style: textStyle1),
              ),
            ],
          );
        });
  }

  Future<void> getList() async {
    installments = await DatabaseHelper.instance.getNoteList();
  }
}
