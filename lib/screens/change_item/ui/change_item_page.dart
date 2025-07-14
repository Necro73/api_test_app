import 'package:api_test_app/core/widgets/custom_button.dart';
import 'package:api_test_app/core/widgets/item_form.dart';
import 'package:api_test_app/data/models/main/item.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:api_test_app/screens/change_item/bloc/change_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeItemPage extends StatelessWidget {
  const ChangeItemPage({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeItemBloc(
        pageState: PageState(item: item),
        mainRepository: MainRepository(),
        item: item,
      ),
      child: BlocConsumer<ChangeItemBloc, ChangeItemState>(
        listener: (context, state) {
          if (state is ChangeItemError) {
            SnackBar(content: Text(state.pageState.errMsg));
          } else if (state is ChangeItemOnPop) {
            Navigator.pop(context, state.pageState.isUpdate);
          }
        },
        builder: (context, state) {
          ChangeItemBloc bloc = context.read<ChangeItemBloc>();
          final Item item = state.pageState.item;
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Добавить объект'),
                  leading: BackButton(
                    onPressed: () {
                      Navigator.of(context).pop(state.pageState.isUpdate);
                    },
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: ListView(
                    children: [
                      ItemForm(
                        item: item,
                        onChangeName: (value) {
                          bloc.add(ChangeItemSetItem(item: item.copyWith(name: value)));
                        },
                        onChangeFigureType: (value) {
                          bloc.add(ChangeItemSetItem(item: item.copyWith(figureType: value)));
                        },
                        onChangeColor: (value) {
                          bloc.add(ChangeItemSetItem(item: item.copyWith(color: value)));
                        },
                        onChangePrice: (value) {
                          bloc.add(ChangeItemSetItem(item: item.copyWith(price: int.parse(value))));
                        },
                      ),
                      const SizedBox(height: 24),
                      (state.pageState.onAwait)
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              title: 'Обновить объект',
                              onTap: () {
                                bloc.add(ChangeItemSendItem());
                              },
                            ),
                      const SizedBox(height: 8),
                      CustomButton(
                        title: 'Удалить объект',
                        backgroundColor: const Color(0xFFFF0000),
                        onTap: () {
                          bloc.add(ChangeItemRemoveItem());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
