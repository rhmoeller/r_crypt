import 'dart:math';

import 'package:r_crypt/algorithms/diffie_hellman/*.dart';
import 'package:r_crypt/framework/key_exchange/*.dart';

import 'secret.dart';
import 'shared.dart';
import 'shared_secret.dart';

/// Diffie Hellman
/// agree on public numbers:
/// g - small prime number
/// n - big (4k bits)
///
/// Alice picks a private number a - random number between 1 inclusive - n inclusive
/// Bob picks a private number b - random number between 1 inclusive - n inclusive
///
/// 1. Alice calculates ((g to the power of a) modulo n) their public key (pa)
/// 2. Bob calculates ((g to the power of b) modulo n) their public key (pb)
/// 3. Alica and Bob exchange their public keys
///
/// 4. Alice calculates (((g to the power of pb) to the power of a) modulo n) = (g to pba) mod n
/// 4. Bob calculates (((g to the power of pa) to the power of b) modulo n) = (g to pab) mod n
/// todo: Make this use bytes rather than int
class DiffieHellman extends KeyExchangeAlgorithm<DiffieHellmanShared, DiffieHellmanSharedSecret, DiffieHellmanResult> {
  @override
  DiffieHellmanSharedSecret basedOn(final DiffieHellmanShared shared) {
    return DiffieHellmanSharedSecret(shared: shared, secret: calculateSecretFrom(shared));
  }

  DiffieHellmanSecret calculateSecretFrom(final DiffieHellmanShared shared) {
    final int betweenOneInclusiveAndNExclusive = Random.secure().nextInt(shared.n - 1) + 1;
    return DiffieHellmanSecret(betweenOneInclusiveAndNExclusive);
  }
}
