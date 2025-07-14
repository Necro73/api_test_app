import 'package:api_test_app/core/widgets/item_form_color_field.dart';
import 'package:api_test_app/data/models/main/item.dart';
import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({
    required this.item,
    required this.onChangeName,
    required this.onChangeFigureType,
    required this.onChangeColor,
    required this.onChangePrice,
    super.key,
  });

  final Item item;
  final Function(String) onChangeName;
  final Function(String) onChangeFigureType;
  final Function(String) onChangeColor;
  final Function(String) onChangePrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Название:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          initialValue: item.name,
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            onChangeName(value);
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Тип фигуры:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        SizedBox(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(16),
            style: Theme.of(context).textTheme.bodyLarge,
            icon: const Icon(Icons.keyboard_arrow_down),
            padding: const EdgeInsets.all(8),
            underline: const SizedBox.shrink(),
            isDense: true,
            menuWidth: 150,
            value: item.figureType,
            items: const [
              DropdownMenuItem(value: 'квадрат', child: Text('квадрат')),
              DropdownMenuItem(value: 'круг', child: Text('круг')),
            ],
            onChanged: (value) {
              onChangeFigureType(value ?? '');
            },
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Цвет:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ItemFormColorField(
              title: 'Красный:',
              color: item.color.substring(4, 6),
              newColorPrefix: item.color.substring(0, 4),
              newColorSuffix: item.color.substring(6, 10),
              onTap: (String value) {
                onChangeColor(value);
              },
            ),
            const SizedBox(width: 8),
            ItemFormColorField(
              title: 'Зелёный:',
              color: item.color.substring(6, 8),
              newColorPrefix: item.color.substring(0, 6),
              newColorSuffix: item.color.substring(8, 10),
              onTap: (String value) {
                onChangeColor(value);
              },
            ),
            const SizedBox(width: 8),
            ItemFormColorField(
              title: 'Синий:',
              color: item.color.substring(8, 10),
              newColorPrefix: item.color.substring(0, 8),
              newColorSuffix: '',
              onTap: (String value) {
                onChangeColor(value);
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Цена:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          initialValue: item.price.toString(),
          keyboardType: TextInputType.number,
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            if (value == '') {
              value = '0';
            }
            onChangePrice(value);
          },
        ),
      ],
    );
  }
}
