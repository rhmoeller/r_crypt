import 'package:flutter/foundation.dart';

class KeyDerivationResult<CARRY_KEY, OUTPUT_KEY> {
  final CARRY_KEY carry;
  final OUTPUT_KEY output;

  KeyDerivationResult({@required this.carry, @required this.output});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeyDerivationResult && runtimeType == other.runtimeType && output == other.output && carry == other.carry;

  @override
  int get hashCode => output.hashCode ^ carry.hashCode;

  @override
  String toString() {
    return 'KeyDerivationResult{carryValue: $carry, outputValue: $output}';
  }
}
