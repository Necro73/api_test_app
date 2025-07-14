import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    this.backgroundColor = const Color(0xFF22CC22),
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: const Color(0xFFFFFFFF)),
          ),
        ),
      ),
    );
  }
}
