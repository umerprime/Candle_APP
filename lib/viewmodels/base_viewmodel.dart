import 'package:get/get.dart';


class BaseViewmodel extends GetxController {
  ViewState _appState = ViewState.idle;
  ViewState get state => _appState;



  void updateState(ViewState state) {
    _appState = state;
    update();
  }
}
enum ViewState { idle, busy }
