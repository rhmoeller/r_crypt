import 'promise.dart';

abstract class KeyExchangeAlgorithm<INTERNAL_EXCHANGE_INPUT, EXTERNAL_EXCHANGE_INPUT, EXCHANGE_RESULT> {
  KeyExchangePromise<EXTERNAL_EXCHANGE_INPUT, EXCHANGE_RESULT> basedOn(final INTERNAL_EXCHANGE_INPUT internalExchangeInput);
}
