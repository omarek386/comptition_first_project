import 'package:flutter/material.dart';

class MyCustomTable extends StatelessWidget {
  final String installments;
  final String deadTime;
  final String notes;
  const MyCustomTable(
      {super.key,
      required this.installments,
      required this.deadTime,
      required this.notes});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: [
            Text(installments, textAlign: TextAlign.center),
            Text(deadTime, textAlign: TextAlign.center),
            Text(notes, textAlign: TextAlign.center),
          ],
        ),
      ],
    );
  }
}
