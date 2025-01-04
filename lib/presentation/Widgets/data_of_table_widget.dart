import 'package:comptition_first_project/Extensions/device_size.dart';
import 'package:comptition_first_project/Helper/spacing.dart';
import 'package:comptition_first_project/presentation/Widgets/table.dart';
import 'package:flutter/material.dart';

class DataOfTableWidget extends StatelessWidget {
  const DataOfTableWidget({
    super.key,
    required this.installments,
  });

  final List installments;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(context.deviceHeight / 3),
        MyCustomTable(
            installments: 'القسط الشهري',
            deadTime: 'الميعاد',
            notes: 'ملاحظات'),
        Expanded(
          child: ListView.builder(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: installments.length,
            itemBuilder: (context, index) {
              return MyCustomTable(
                installments: installments[index].monthlyInstallment,
                deadTime: installments[index].deadTime,
                notes: installments[index].note,
              );
            },
          ),
        ),
      ],
    );
  }
}
