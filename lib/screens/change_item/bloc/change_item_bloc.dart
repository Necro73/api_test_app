import 'package:api_test_app/data/models/main/item.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_item_event.dart';

part 'change_item_state.dart';

class ChangeItemBloc extends Bloc<ChangeItemEvent, ChangeItemState> {
  ChangeItemBloc({
    required PageState pageState,
    required this.mainRepository,
    required this.item,
  }) : super(ChangeItemInitial(pageState)) {
    on<ChangeItemInit>(changeItemInit);
    on<ChangeItemSetItem>(changeItemSetItem);
    on<ChangeItemSendItem>(changeItemSendItem);
    on<ChangeItemRemoveItem>(changeItemRemoveItem);
    on<ChangeItemMsgErr>(changeItemMsgErr);
    add(ChangeItemInit());
  }

  final MainRepository mainRepository;
  final Item item;

  changeItemInit(ChangeItemInit event, emit) async {
    emit(ChangeItemUp(state.pageState.copyWith(
      onAwait: false,
      item: item,
    )));
  }

  changeItemSetItem(ChangeItemSetItem event, emit) async {
    emit(ChangeItemUp(state.pageState.copyWith(item: event.item)));
  }

  changeItemSendItem(ChangeItemSendItem event, emit) async {
    emit(ChangeItemUp(state.pageState.copyWith(onAwait: true)));
    await mainRepository.testItemPut(request: state.pageState.item);
    emit(ChangeItemUp(state.pageState.copyWith(
      onAwait: false,
      isUpdate: true,
    )));
  }

  changeItemRemoveItem(ChangeItemRemoveItem event, emit) async {
    emit(ChangeItemUp(state.pageState.copyWith(onAwait: true)));
    await mainRepository.testItemDelete(request: state.pageState.item);
    emit(ChangeItemOnPop(state.pageState.copyWith(
      onAwait: false,
      isUpdate: true,
    )));
  }

  changeItemMsgErr(ChangeItemMsgErr event, emit) async {
    emit(ChangeItemError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ChangeItemMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
