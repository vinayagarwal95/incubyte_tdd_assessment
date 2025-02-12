import 'string_add.dart';
void main() {
  final calculator = StringCalculator();

  print(calculator.add(""));                // 0
  print(calculator.add("1"));               // 1
  print(calculator.add("1,2,3"));           // 6
  print(calculator.add("1\n2,3"));          // 6
  print(calculator.add("//;\n1;2;3"));      // 6

  try {
    print(calculator.add("1,-2,3"));       // Exception: Negative numbers not allowed: -2
  } catch (e) {
    print(e);
  }

  try {
    print(calculator.add("1,a,3"));        // Exception: Invalid input: Mixed characters and numbers are not allowed.
  } catch (e) {
    print(e);
  }
}