import 'string_add.dart';

void main() {
  final calculator = StringCalculator();

  print(calculator.add("")); // 0
  print(calculator.add("1")); // 1
  print(calculator.add("1,2")); // 3
  print(calculator.add("1\n2,3")); // 6
  print(calculator.add("//;\n1;2;3")); // 6
  
  try {
    print(calculator.add("1,-2,3")); // Should throw an exception
  } catch (e) {
    print("Error: $e"); // Error: negative numbers not allowed -2
  }
 
}