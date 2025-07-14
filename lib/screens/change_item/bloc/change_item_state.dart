part of 'change_item_bloc.dart';

abstract class ChangeItemState {
  final PageState pageState;

  const ChangeItemState(this.pageState);
}

class ChangeItemInitial extends ChangeItemState {
  const ChangeItemInitial(super.pageState);
}

class ChangeItemUp extends ChangeItemState {
  const ChangeItemUp(super.pageState);
}

class ChangeItemError extends ChangeItemState {
  const ChangeItemError(super.pageState);
}

class ChangeItemOnPop extends ChangeItemState {
  const ChangeItemOnPop(super.pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final Item item;
  final bool isUpdate;

  const PageState({
    this.onAwait = true,
    this.errMsg = '',
    this.item = const Item(),
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
