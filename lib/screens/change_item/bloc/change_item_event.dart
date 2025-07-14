part of 'change_item_bloc.dart';

abstract class ChangeItemEvent {}

class ChangeItemInit extends ChangeItemEvent {}

class ChangeItemSetItem extends ChangeItemEvent {
  final Item item;
  ChangeItemSetItem({required this.item});
}

class ChangeItemSendItem extends ChangeItemEvent {}

class ChangeItemRemoveItem extends ChangeItemEvent {}

class ChangeItemMsgErr extends ChangeItemEvent {
  final String msg;
  ChangeItemMsgErr(this.msg);
}
