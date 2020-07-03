import 'dart:math';

import 'package:r_crypt/framework/key_exchange/promise.dart';

import 'result.dart';
import 'secret.dart';
import 'shared.dart';

class DiffieHellmanSharedSecret extends KeyExchangePromise<DiffieHellmanSharedSecret, DiffieHellmanResult> {
  final DiffieHellmanShared shared;
  final DiffieHellmanSecret secret;

  DiffieHellmanSharedSecret(this.shared, this.secret);

  @override
  DiffieHellmanResult resolveWith(DiffieHellmanSharedSecret party) {
    return DiffieHellmanResult(shared: shared, secret: secret, party: party);
  }

  int getValue() {
    var g = shared.g;
    var n = shared.n;
    var a = secret.getValue();
    return pow(g, a) % n;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiffieHellmanSharedSecret && runtimeType == other.runtimeType && shared == other.shared && secret == other.secret;

  @override
  int get hashCode => shared.hashCode ^ secret.hashCode;

  @override
  String toString() {
    return 'DiffieHellmanSharedSecret{shared: $shared, secret: $secret}';
  }

}
