import 'package:flutter/foundation.dart';

class KeyDerivationInput<INPUT_KEY, CARRY_KEY> {
  final INPUT_KEY input;
  final CARRY_KEY carry;

  KeyDerivationInput({@required this.input, @required this.carry});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is KeyDerivationInput && runtimeType == other.runtimeType && input == other.input && carry == other.carry;

  @override
  int get hashCode => input.hashCode ^ carry.hashCode;

  @override
  String toString() {
    return 'KeyDerivationInput{inputValue: $input, carryValue: $carry}';
  }
}
