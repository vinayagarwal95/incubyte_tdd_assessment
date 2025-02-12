import 'string_add.dart';
import 'dart:io';

void main() {
  final calculator = StringCalculator();

  while (true) {
    stdout.write("Enter numbers (or type 'exit' to quit): ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print("Exiting...");
      break;
    }

    try {
      int result = calculator.add(input);
      print("Result: $result");
    } catch (e) {
      print("Error: $e");
    }
  }
}
