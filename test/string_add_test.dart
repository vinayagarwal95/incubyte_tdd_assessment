import 'package:test/test.dart';
import '../lib/string_add.dart';  // Adjust the import based on your file structure

void main() {
  group('String Calculator Tests', () {
    test('Empty string should return 0', () {
      expect(add(""), equals(0));
    });

    test('Single number should return the number itself', () {
      expect(add("1"), equals(1));
      expect(add("5"), equals(5));
    });

    test('Two numbers should return their sum', () {
      expect(add("1,2"), equals(3));
      expect(add("10,20"), equals(30));
    });

    test('Multiple numbers should return their sum', () {
      expect(add("1,2,3,4,5"), equals(15));
    });

    test('Newline as delimiter should work', () {
      expect(add("1\n2,3"), equals(6));
    });

    test('Custom delimiter should work', () {
      expect(add("//;\n1;2;3"), equals(6));
      expect(add("//-\n1-2-3"), equals(6));
      expect(add("//***\n1***2***3"), equals(6));
    });

    test('Negative numbers should throw an exception', () {
      expect(() => add("1,-2,3"), throwsA(predicate((e) =>
          e is Exception && e.toString().contains("negative numbers not allowed -2"))));
    });

    test('Multiple negative numbers should all be listed in the exception', () {
      expect(() => add("1,-2,-3,4"), throwsA(predicate((e) =>
          e is Exception && e.toString().contains("negative numbers not allowed -2,-3"))));
    });
  });
}
