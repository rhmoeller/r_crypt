import 'package:flutter_test/flutter_test.dart';
import 'package:r_crypt/framework/key_exchange/*.dart';

void keyExchange() {
  test('takes a key and returns an exchange to be resolved by a counterparty', () {
    final KeyExchangeAlgorithmImpl keyExchangeAlgorithm = KeyExchangeAlgorithmImpl();
    final String senderKeyExchangeInput = 'dolorem';
    final String recipientKeyExchangeInput = 'ipsum';

    final String exchange = keyExchangeAlgorithm.exchange(senderKeyExchangeInput).resolveWith(recipientKeyExchangeInput);

    expect(exchange, 'dolorem ipsum');
  });
}

class KeyExchangeAlgorithmImpl extends KeyExchangeAlgorithm<String, String> {
  @override
  String apply(String senderKeyExchangeInput, String recipientKeyExchangeInput) {
    return "$senderKeyExchangeInput $recipientKeyExchangeInput";
  }
}
