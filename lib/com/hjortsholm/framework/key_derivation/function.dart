
import 'input.dart';
import 'result.dart';

abstract class KeyDerivationFunction<INPUT_KEY, CARRY_KEY, OUTPUT_KEY> {
  KeyDerivationResult<CARRY_KEY, OUTPUT_KEY> derive(final KeyDerivationInput<INPUT_KEY, CARRY_KEY> keyDerivationInput);
}
