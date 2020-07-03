class DiffieHellmanShared {
  final int n; // large number, preferrably 4k bits
  final int g; // low prime

  DiffieHellmanShared({this.n, this.g});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DiffieHellmanShared && runtimeType == other.runtimeType && n == other.n && g == other.g;

  @override
  int get hashCode => n.hashCode ^ g.hashCode;

  @override
  String toString() {
    return 'DiffieHellmanShared{n: $n, g: $g}';
  }
}
