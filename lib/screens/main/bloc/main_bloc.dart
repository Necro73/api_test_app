import 'package:api_test_app/data/models/main/item.dart';
import 'package:api_test_app/repositories/main_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required PageState pageState,
    required this.mainRepository,
  }) : super(MainInitial(pageState)) {
    on<MainInit>(mainInit);
    on<MainMsgErr>(mainMsgErr);
    add(MainInit());
  }

  final MainRepository mainRepository;

  mainInit(MainInit event, emit) async {
    emit(MainUp(state.pageState.copyWith(onAwait: true)));
    List<Item> items = await mainRepository.testItems();
    emit(MainUp(state.pageState.copyWith(
      onAwait: false,
      items: items,
    )));
  }

  mainMsgErr(MainMsgErr event, emit) async {
    emit(MainError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(MainMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
