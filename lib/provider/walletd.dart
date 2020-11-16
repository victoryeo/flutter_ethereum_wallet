import '../stores/wallet_store.dart';
import 'package:flutter/foundation.dart';

class Walletd extends ChangeNotifier {
  String _mnemonic;
  var _step = WalletCreateSteps.display;
  String get getMnemonic {
    return _mnemonic;
  }

  WalletCreateSteps get getStep {
    return _step;
  }

  void setMnemonic(String mnemonic) {
    _mnemonic = mnemonic;
    notifyListeners();
  }

  void setStep(WalletCreateSteps value) {
    _step = value;
    notifyListeners();
  }
}