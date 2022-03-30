import 'package:get/get.dart';
import 'package:candle/viewmodels/auth_view_model.dart';
import 'package:candle/viewmodels/candle_view_model.dart';


class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel(), fenix: true);
  }
}
class CandleBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CandleViewModel>(() => CandleViewModel(), fenix: true);
  }
}
