// todo: Come up with a better name
abstract class KeyExchangePromise<EXTERNAL_EXCHANGE_INPUT, EXCHANGE_RESULT> {
  // todo: Come up with a better name
  EXCHANGE_RESULT resolveWith(final EXTERNAL_EXCHANGE_INPUT externalExchangeInput);
}
