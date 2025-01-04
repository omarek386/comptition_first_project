import 'package:comptition_first_project/presentation/Widgets/dismes.dart';
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
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // verticalSpace(context.deviceHeight / 3),
        MyCustomTable(
            installments: 'القسط الشهري',
            deadTime: 'الميعاد',
            notes: 'ملاحظات'),
        Expanded(
          child: MyCustomDismissible(items: installments),
        ),
      ],
    );
  }
}
