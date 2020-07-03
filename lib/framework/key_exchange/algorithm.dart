
import 'promise.dart';

abstract class KeyExchangeAlgorithm<EXCHANGE_INPUT, EXCHANGE_RESULT> {
	KeyExchangePromise<EXCHANGE_INPUT, EXCHANGE_RESULT> exchange(final EXCHANGE_INPUT senderKeyExchangeInput) {
		return KeyExchangePromise(
			keyExchangeAlgorithm: this,
			senderKeyExchangeInput: senderKeyExchangeInput
			);
	}

	EXCHANGE_RESULT apply(final EXCHANGE_INPUT senderKeyExchangeInput, final EXCHANGE_INPUT recipientKeyExchangeInput);
}