import 'package:flutter_test/flutter_test.dart';
import 'package:r_crypt/framework/key_exchange/*.dart';

void keyExchange() {
  test('takes a key and returns an exchange to be resolved by a counterparty', () {
    final KeyExchangeAlgorithmImpl keyExchangeAlgorithm = KeyExchangeAlgorithmImpl();
    final String senderKeyExchangeInput = 'dolorem';
    final String recipientKeyExchangeInput = 'ipsum';

    final String exchange = keyExchangeAlgorithm.basedOn(senderKeyExchangeInput).resolveWith(recipientKeyExchangeInput);

    expect(exchange, 'dolorem ipsum');
  });
}

class KeyExchangeAlgorithmImpl extends KeyExchangeAlgorithm<String, String, String> {
  @override
  KeyExchangePromise<String, String> basedOn(String internalExchangeInput) {
    return KeyExchangePromiseImpl(internalExchangeInput);
  }
}

class KeyExchangePromiseImpl extends KeyExchangePromise<String, String> {
  final String internalExchangeInput;

  KeyExchangePromiseImpl(this.internalExchangeInput);

  @override
  String resolveWith(String externalExchangeInput) {
    return '$internalExchangeInput $externalExchangeInput';
  }
}
