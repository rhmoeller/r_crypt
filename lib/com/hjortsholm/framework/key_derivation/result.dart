class KeyDerivationResult<CARRY_KEY, OUTPUT_KEY> {
  final OUTPUT_KEY outputValue;
  final CARRY_KEY carryValue;

  KeyDerivationResult(this.outputValue, this.carryValue);

  OUTPUT_KEY get output => outputValue;

  CARRY_KEY get carry => carryValue;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeyDerivationResult && runtimeType == other.runtimeType && outputValue == other.outputValue && carryValue == other.carryValue;

  @override
  int get hashCode => outputValue.hashCode ^ carryValue.hashCode;

  @override
  String toString() {
    return 'KeyDerivationResult{outputValue: $outputValue, carryValue: $carryValue}';
  }
}
