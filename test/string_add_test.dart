

import 'package:test/test.dart';
import 'package:string_calculator/string_add.dart';


void main() {
  final calculator = StringCalculator();

  test('Empty string returns 0', () {
    expect(calculator.add(""), 0);
  });

  test('Single number returns itself', () {
    expect(calculator.add("5"), 5);
  });

  test('Two numbers comma-separated return sum', () {
    expect(calculator.add("1,2"), 3);
  });

  test('Supports newlines as delimiters', () {
    expect(calculator.add("1\n2,3"), 6);
  });

  test('Supports custom delimiters', () {
    expect(calculator.add("//;\n1;2"), 3);
  });

  test('Throws error for negative numbers', () {
    expect(() => calculator.add("1,-2,3,-4"),
        throwsA(predicate((e) => e.toString().contains("Negative numbers not allowed: -2, -4"))));
  });
}

