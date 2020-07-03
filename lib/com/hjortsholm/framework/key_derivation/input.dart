
class KeyDerivationInput<INPUT_KEY, CARRY_KEY> {
	final INPUT_KEY inputValue;
	final CARRY_KEY carryValue;

	KeyDerivationInput(this.inputValue, this.carryValue);

	INPUT_KEY get input => inputValue;

	CARRY_KEY get carry => carryValue;

	@override
	bool operator ==(Object other) =>
		identical(this, other) ||
			other is KeyDerivationInput && runtimeType == other.runtimeType && inputValue == other.inputValue && carryValue == other.carryValue;

	@override
	int get hashCode => inputValue.hashCode ^ carryValue.hashCode;

	@override
	String toString() {
		return 'KeyDerivationInput{inputValue: $inputValue, carryValue: $carryValue}';
	}
}
