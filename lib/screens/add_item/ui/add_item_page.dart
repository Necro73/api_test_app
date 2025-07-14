import 'package:api_test_app/core/widgets/custom_button.dart';
import 'package:api_test_app/core/widgets/item_form.dart';
import 'package:api_test_app/data/models/main/item.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:api_test_app/screens/add_item/bloc/add_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddItemBloc(
        pageState: const PageState(),
        mainRepository: MainRepository(),
      ),
      child: BlocConsumer<AddItemBloc, AddItemState>(
        listener: (context, state) {
          if (state is AddItemError) {
            SnackBar(content: Text(state.pageState.errMsg));
          }
        },
        builder: (context, state) {
          AddItemBloc bloc = context.read<AddItemBloc>();
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
                        item: state.pageState.item,
                        onChangeName: (value) {
                          bloc.add(AddItemSetItem(item: item.copyWith(name: value)));
                        },
                        onChangeFigureType: (value) {
                          bloc.add(AddItemSetItem(item: item.copyWith(figureType: value)));
                        },
                        onChangeColor: (value) {
                          bloc.add(AddItemSetItem(item: item.copyWith(color: value)));
                        },
                        onChangePrice: (value) {
                          bloc.add(AddItemSetItem(item: item.copyWith(price: int.parse(value))));
                        },
                      ),
                      const SizedBox(height: 24),
                      (state.pageState.onAwait)
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                              title: 'Добавить объект',
                              onTap: () {
                                bloc.add(AddItemSendItem());
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
