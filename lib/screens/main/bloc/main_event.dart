part of 'main_bloc.dart';

abstract class MainEvent {}

class MainInit extends MainEvent {}

class MainMsgErr extends MainEvent {
  final String msg;
  MainMsgErr(this.msg);
}
