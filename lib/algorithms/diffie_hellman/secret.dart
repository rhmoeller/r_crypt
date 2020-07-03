class DiffieHellmanSecret {
  final int secret;

  DiffieHellmanSecret(this.secret);

  int getValue() {
    return secret;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DiffieHellmanSecret && runtimeType == other.runtimeType && secret == other.secret;

  @override
  int get hashCode => secret.hashCode;

  @override
  String toString() {
    return 'DiffieHellmanSecret{secret: $secret}';
  }
}
