import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropDownList extends StatefulWidget {
  final double width;
  final Color boxColor;
  final Color dropdownColor;
  final Color textColor;
  final List<String> values;
  final Color iconColor;
  const MyDropDownList({
    super.key,
    this.width = 150,
    required this.values,
    this.iconColor = Colors.white,
    this.boxColor = const Color.fromRGBO(53, 53, 53, 1),
    this.textColor = Colors.white,
    this.dropdownColor = const Color.fromRGBO(53, 53, 53, 1),
  });

  @override
  State<MyDropDownList> createState() => _MyDropDownListState();
}

class _MyDropDownListState extends State<MyDropDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      decoration: BoxDecoration(
          color: widget.boxColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
        horizontal: widget.width * 0.1,
      ),
      child: DropdownButton(
        iconEnabledColor: widget.iconColor,
        isExpanded: true,
        underline: Container(),
        dropdownColor: widget.dropdownColor,
        style: TextStyle(color: widget.textColor),
        value: widget.values.first,
        items: widget.values.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (e) {},
      ),
    );
  }
}
