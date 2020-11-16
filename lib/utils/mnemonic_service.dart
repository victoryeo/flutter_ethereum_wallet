import 'hd_key.dart';
import 'package:bip39/bip39.dart' as bip39;
import "package:hex/hex.dart";
import 'package:web3dart/credentials.dart';

abstract class IMnemonicService {
  String generateMnemonic();
  String getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicAddress(String privateKey);
  String entropyToMnemonic(String entropyMnemonic);
}

class MnemonicService implements IMnemonicService {
  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  String entropyToMnemonic(String entropyMnemonic) {
    return bip39.entropyToMnemonic(entropyMnemonic);
  }

  @override
  String getPrivateKey(String mnemonic) {
    String seed = bip39.mnemonicToSeedHex(mnemonic);
    KeyData master = HDKey.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);
    print("private: $privateKey");
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);

    final address = await private.extractAddress();
    print("address: $address");
    return address;
  }
}
