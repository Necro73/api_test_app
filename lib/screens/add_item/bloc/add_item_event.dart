part of 'add_item_bloc.dart';

abstract class AddItemEvent {}

class AddItemInit extends AddItemEvent {}

class AddItemSetItem extends AddItemEvent {
  final Item item;
  AddItemSetItem({required this.item});
}

class AddItemSendItem extends AddItemEvent {}

class AddItemMsgErr extends AddItemEvent {
  final String msg;
  AddItemMsgErr(this.msg);
}
