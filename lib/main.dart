import 'string_add.dart';

void main() {
  print(add("")); // 0
  print(add("1")); // 1
  print(add("1,2")); // 3
  print(add("1\n2,3")); // 6
  print(add("//;\n1;2;3")); // 6
  
  try {
    print(add("1,-2,3")); // Should throw an exception
  } catch (e) {
    print("Error: $e"); // Error: negative numbers not allowed -2
  }
 
}