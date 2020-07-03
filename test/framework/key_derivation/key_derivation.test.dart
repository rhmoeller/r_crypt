import 'package:flutter_test/flutter_test.dart';
import 'package:r_crypt/com/hjortsholm/framework/key_derivation/key_derivation.dart';

void keyDerivation() {
  test('executes key derivation and returns result', () {
    final KeyDerivationFunction keyDerivation = KeyDerivationFunctionImpl();
    final KeyDerivationInput<String, String> keyDerivationInput = KeyDerivationInput('input 1', 'input 2');

    final KeyDerivationResult<String, String> derived = keyDerivation.derive(keyDerivationInput);

    expect(derived, KeyDerivationResult('input 1 -> output 1', 'input 2 -> output 2'));
  });
}

class KeyDerivationFunctionImpl implements KeyDerivationFunction<String, String, String> {
  @override
  KeyDerivationResult<String, String> derive(KeyDerivationInput<String, String> keyDerivationInput) {
    return KeyDerivationResult("${keyDerivationInput.input} -> output 1", "${keyDerivationInput.carry} -> output 2");
  }
}
