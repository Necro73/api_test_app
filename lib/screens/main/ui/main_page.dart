import 'package:api_test_app/core/widgets/custom_button.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:api_test_app/screens/add_item/ui/add_item_page.dart';
import 'package:api_test_app/screens/change_item/ui/change_item_page.dart';
import 'package:api_test_app/screens/main/bloc/main_bloc.dart';
import 'package:api_test_app/screens/main/ui/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(
        pageState: const PageState(),
        mainRepository: MainRepository(),
      ),
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {
          if (state is MainError) {
            SnackBar(content: Text(state.pageState.errMsg));
          }
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: (state.pageState.onAwait)
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: state.pageState.items
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: ItemWidget(
                                        item: e,
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeItemPage(item: e))).then(
                                            (value) {
                                              if (value && context.mounted) {
                                                context.read<MainBloc>().add(MainInit());
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomButton(
                          title: 'Добавить объект',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddItemPage())).then(
                              (value) {
                                if (value && context.mounted) {
                                  context.read<MainBloc>().add(MainInit());
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
