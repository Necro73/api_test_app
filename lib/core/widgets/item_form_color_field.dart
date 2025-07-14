import 'package:flutter/material.dart';

class ItemFormColorField extends StatelessWidget {
  const ItemFormColorField({
    required this.title,
    required this.color,
    required this.newColorPrefix,
    required this.newColorSuffix,
    required this.onTap,
    super.key,
  });

  final String title;
  final String color;
  final String newColorPrefix;
  final String newColorSuffix;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 4),
        SizedBox(
          width: 40,
          child: TextFormField(
            initialValue: color,
            maxLength: 2,
            onEditingComplete: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: (value) {
              if (value.isEmpty) value = '00';
              if (value.length == 1) value = '0$value';
              onTap('$newColorPrefix$value$newColorSuffix'.toUpperCase());
            },
          ),
        ),
      ],
    );
  }
}
