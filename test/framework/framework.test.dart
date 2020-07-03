import 'package:flutter_test/flutter_test.dart';

import 'key_derivation.test.dart';
import 'key_exchange.test.dart';

void framework() {
  group('KeyDerivation', keyDerivation);
  group('KeyExchange', keyExchange);
}
