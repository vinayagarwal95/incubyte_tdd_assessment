

import 'package:test/test.dart';
import 'package:string_calculator/string_add.dart';


void main() {
  final calculator = StringCalculator();

  group('StringCalculator Tests', () {
    test('Returns 0 for empty string', () {
      expect(calculator.add(""), equals(0));
    });

    test('Returns the number itself for a single number', () {
      expect(calculator.add("1"), equals(1));
    });

    test('Handles two numbers separated by comma', () {
      expect(calculator.add("1,5"), equals(6));
    });

    test('Handles multiple numbers separated by comma', () {
      expect(calculator.add("1,2,3,4,5"), equals(15));
    });

    test('Handles new line as a delimiter', () {
      expect(calculator.add("1\n2,3"), equals(6));
    });

    test('Handles custom delimiters', () {
      expect(calculator.add("//;\n1;2;3"), equals(6));
    });

    test('Throws exception for negative numbers', () {
      expect(() => calculator.add("1,-2,3"), throwsA(predicate((e) {
        return e is Exception && e.toString().contains("Negative numbers not allowed: -2");
      })));
    });

    test('Throws exception for multiple negative numbers', () {
      expect(() => calculator.add("1,-2,-3,4"), throwsA(predicate((e) {
        return e is Exception && e.toString().contains("Negative numbers not allowed: -2, -3");
      })));
    });

    test('Throws exception for mixed characters and numbers', () {
      expect(() => calculator.add("1,a,3"), throwsA(predicate((e) {
        return e is Exception && e.toString().contains("Invalid input: Mixed characters and numbers are not allowed.");
      })));
    });

    test('Handles large inputs correctly', () {
      expect(calculator.add("10,20,30,40,50"), equals(150));
    });
  });
}

