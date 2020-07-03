import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:r_crypt/algorithms/diffie_hellman/*.dart';

const int g = 587; // any small prime number
const int n = 4294967296; // this is as large as int can handle
void algorithm() {
  group('basedOn', () {
    test('given public \'g\' and \'n\' return a key exchange that generates your public key \'pa\' based on your private key \'a\'', () {
      final DiffieHellmanShared shared = DiffieHellmanShared(n: n, g: g);
      final DiffieHellmanSecret secret = DiffieHellmanSecret(69);
      final DiffieHellman diffieHellman = DiffieHellmanStub(secret);

      final DiffieHellmanSharedSecret myPublicKey = diffieHellman.basedOn(shared);

      expect(myPublicKey, DiffieHellmanSharedSecret(shared, secret));
      expect(myPublicKey.getValue(), pow(shared.g, secret.getValue()) % shared.n);
    });

    test(
        'given public \'g\' and \'n\' and your private key \'a\' return an exchange that takes someone elses public key \'pb\' and generates a combination of \'a\' and \'pb\' equal to \'pb^a\'',
        () {
      final DiffieHellmanShared diffieHellmanInput = DiffieHellmanShared(n: n, g: g);
      final DiffieHellmanSecret myPrivateKey = DiffieHellmanSecret(75);
      final DiffieHellmanSharedSecret myPublicKey = DiffieHellmanSharedSecret(diffieHellmanInput, myPrivateKey);
      final DiffieHellmanSharedSecret yourPublicKey = DiffieHellmanSharedSecret(diffieHellmanInput, DiffieHellmanSecret(123));

      final DiffieHellmanResult diffieHellmanResult = myPublicKey.resolveWith(yourPublicKey);

      expect(diffieHellmanResult, DiffieHellmanResult(shared: diffieHellmanInput, secret: myPrivateKey, party: yourPublicKey));
      expect(diffieHellmanResult.getValue(), pow(yourPublicKey.getValue(), myPrivateKey.getValue()) % diffieHellmanInput.n);
    });
  });

  group('generatePrivateKey', () {
    test('should return a DiffieHellmanPrivateKey with a random number between one and n from a given DiffieHellmanInput', () {
      final DiffieHellmanShared shared = DiffieHellmanShared(n: n, g: g);
      final DiffieHellman diffieHellman = DiffieHellman();

      final DiffieHellmanSecret myPrivateKey = diffieHellman.calculateSecretFrom(shared);

      expect(myPrivateKey.getValue(), (pk) => 0 < pk && pk <= shared.n);
    });
  });

  test('IntegrationTest', () {
    final DiffieHellman diffieHellman = DiffieHellman();
    final DiffieHellmanShared shared = DiffieHellmanShared(n: n, g: g);
    final DiffieHellmanSharedSecret yourSharedSecret = DiffieHellmanSharedSecret(shared, diffieHellman.calculateSecretFrom(shared));

    final DiffieHellmanSharedSecret mySharedSecret = diffieHellman.basedOn(shared);
    final DiffieHellmanResult diffieHellmanResult = mySharedSecret.resolveWith(yourSharedSecret);

    expect(diffieHellmanResult, DiffieHellmanResult(shared: shared, secret: mySharedSecret.secret, party: yourSharedSecret));
    expect(diffieHellmanResult.getValue(), pow(yourSharedSecret.getValue(), mySharedSecret.secret.getValue()) % n);
  });
}

class DiffieHellmanStub extends DiffieHellman {
  final DiffieHellmanSecret secret;

  DiffieHellmanStub(this.secret);

  @override
  DiffieHellmanSecret calculateSecretFrom(final DiffieHellmanShared ignored) {
    return secret; // Stubbed private key number
  }
}
