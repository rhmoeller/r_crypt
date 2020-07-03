// todo: Come up with a better name
import 'algorithm.dart';

class KeyExchangePromise<EXCHANGE_INPUT, EXCHANGE_RESULT> {
  final KeyExchangeAlgorithm<EXCHANGE_INPUT, EXCHANGE_RESULT> keyExchangeAlgorithm;
  final EXCHANGE_INPUT senderKeyExchangeInput;

  KeyExchangePromise({this.keyExchangeAlgorithm, this.senderKeyExchangeInput});

  // todo: Come up with a better name
  EXCHANGE_RESULT resolveWith(final EXCHANGE_INPUT recipientKeyExchangeInput) {
    return keyExchangeAlgorithm.apply(senderKeyExchangeInput, recipientKeyExchangeInput);
  }
}
