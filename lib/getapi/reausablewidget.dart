import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  late String title, subTitle;
  final VoidCallback onPress;

  ReusableWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        leading: const CircleAvatar(
          radius: 25,
          child: Text('G'),
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
