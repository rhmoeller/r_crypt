import 'dart:math';

import 'package:flutter/foundation.dart';

import 'secret.dart';
import 'shared.dart';
import 'shared_secret.dart';

class DiffieHellmanResult {
  final DiffieHellmanShared shared;
  final DiffieHellmanSecret secret;
  final DiffieHellmanSharedSecret party;

  DiffieHellmanResult({@required this.shared, @required this.secret, @required this.party});

  int getValue() {
    var n = shared.n;
    var a = secret.getValue();
    var pb = party.getValue();
    return pow(pb, a) % n;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiffieHellmanResult &&
          runtimeType == other.runtimeType &&
          shared == other.shared &&
          secret == other.secret &&
          party == other.party;

  @override
  int get hashCode => shared.hashCode ^ secret.hashCode ^ party.hashCode;

  @override
  String toString() {
    return 'DiffieHellmanResult{shared: $shared, secret: $secret, opposingPublicSecret: $party}';
  }
}
