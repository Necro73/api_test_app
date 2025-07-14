part of 'main_bloc.dart';

abstract class MainState {
  final PageState pageState;

  const MainState(this.pageState);
}

class MainInitial extends MainState {
  const MainInitial(super.pageState);
}

class MainUp extends MainState {
  const MainUp(super.pageState);
}

class MainError extends MainState {
  const MainError(super.pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final List<Item> items;

  const PageState({
    this.onAwait = true,
    this.errMsg = '',
    this.items = const [],
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    List<Item>? items,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      items: items ?? this.items,
    );
  }
}
