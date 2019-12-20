import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlideAction extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final void Function(BuildContext) onTap;

  CustomSlideAction(this.backgroundColor, this.icon, this.onTap,
      {this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      child: Container(
        decoration: BoxDecoration(
          color: this.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(this.icon, color: this.foregroundColor, size: 30),
        ),
      ),
      onTap: () => this.onTap,
    );
  }
}
