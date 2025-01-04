import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCustomDismissible extends StatefulWidget {
  List items;
  MyCustomDismissible({super.key, required this.items});

  @override
  State<MyCustomDismissible> createState() => _MyCustomDismissibleState();
}

class _MyCustomDismissibleState extends State<MyCustomDismissible> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.green,
          ),
          key: Key(widget.items[index].toString()),
          onDismissed: (DismissDirection direction) {
            setState(() {
              widget.items.removeAt(index);
            });
          },
          child: ListTile(
            title: Text(
              'Item ${widget.items[index]}',
            ),
          ),
        );
      },
    );
  }
}
