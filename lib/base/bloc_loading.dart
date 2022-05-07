import 'package:otp_generator/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

class LoadingBloC{
  final BehaviorSubject<bool> _loadingController = BehaviorSubject();

  Stream<bool> get isLoadingStream => _loadingController.stream;

  bool get isLoading => _loadingController.valueOrNull ?? false;

  set isLoading(bool loading) {
    _loadingController.sinkAddSafe(loading);
  }

  void disposeLoadingBloC() {
    _loadingController.close();
  }
}