import 'package:api_test_app/data/models/main/item.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_item_event.dart';

part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc({
    required PageState pageState,
    required this.mainRepository,
  }) : super(AddItemInitial(pageState)) {
    on<AddItemInit>(addItemInit);
    on<AddItemSetItem>(addItemSetItem);
    on<AddItemSendItem>(addItemSendItem);
    on<AddItemMsgErr>(addItemMsgErr);
    add(AddItemInit());
  }

  final MainRepository mainRepository;

  addItemInit(AddItemInit event, emit) async {
    emit(AddItemUp(state.pageState.copyWith(onAwait: false)));
  }

  addItemSetItem(AddItemSetItem event, emit) async {
    emit(AddItemUp(state.pageState.copyWith(item: event.item)));
  }

  addItemSendItem(AddItemSendItem event, emit) async {
    emit(AddItemUp(state.pageState.copyWith(onAwait: true)));
    await mainRepository.testItemPost(request: state.pageState.item);
    emit(AddItemUp(state.pageState.copyWith(
      onAwait: false,
      isUpdate: true,
    )));
  }

  addItemMsgErr(AddItemMsgErr event, emit) async {
    emit(AddItemError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AddItemMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
