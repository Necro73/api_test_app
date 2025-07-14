part of 'add_item_bloc.dart';

abstract class AddItemState {
  final PageState pageState;

  const AddItemState(this.pageState);
}

class AddItemInitial extends AddItemState {
  const AddItemInitial(super.pageState);
}

class AddItemUp extends AddItemState {
  const AddItemUp(super.pageState);
}

class AddItemError extends AddItemState {
  const AddItemError(super.pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final Item item;
  final bool isUpdate;

  const PageState({
    this.onAwait = true,
    this.errMsg = '',
    this.item = const Item(
      itemId: 0,
      name: "Обычный квадрат",
      figureType: "квадрат",
      color: "0xFF000000",
      price: 5000,
    ),
    this.isUpdate = false,
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    Item? item,
    bool? isUpdate,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      item: item ?? this.item,
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }
}
