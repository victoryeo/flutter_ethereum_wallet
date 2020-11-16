import '../stores/wallet_store.dart';
import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  var _count = 0;
  var _step = WalletCreateSteps.display;
  int get getCounter {
    return _count;
  }
  WalletCreateSteps get getStep {
    return _step;
  }

  void incrementCounter() {
    _count +-1;
    notifyListeners();
  }

  void setStep(WalletCreateSteps value) {
    _step = value;
    notifyListeners();
  }
}