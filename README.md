String Calculator (Dart)
Overview
The String Calculator is a simple Dart program that takes a string of numbers (separated by commas, new lines, or custom delimiters) and returns their sum. It also includes validation to reject negative numbers and mixed input (numbers + characters).

Features
Handles an empty string ("") and returns 0.
Supports adding multiple numbers separated by , or \n.
Allows custom delimiters using //[delimiter]\n[numbers] (e.g., "//;\n1;2" returns 3).
Throws an error for negative numbers ("negative numbers not allowed").
Throws an error for mixed input ("invalid input: contains non-numeric characters").
Installation & Running the Program
1. Install Dart (if not already installed)
Download and install Dart from the official site: https://dart.dev/get-dart

2. Clone or Create the Dart File
Create a Dart file string_add.dart and copy the code.

3. Run the Program
To execute the program, run:

dart lib/string_calculator.dart
The program will prompt you to enter a string, then display the sum or an error message.

Usage Example
Input 1:

Enter numbers (or type 'exit' to quit): 1,2,3
Output:
Sum: 6

Input 2:
Enter numbers (or type 'exit' to quit): 1\n2,3
Output:
Sum: 6

Input 3:
Enter numbers (or type 'exit' to quit): //;\n1;2;3
Output:
Sum: 6

Input 4 (Negative Numbers):
Enter numbers (or type 'exit' to quit): 5,-3,2
Output:
Error: negative numbers not allowed -3

Input 5 (Mixed Input - Invalid Characters):
Enter numbers (or type 'exit' to quit): 2,a,3
Output:
Error: invalid input: contains non-numeric characters

Running Tests
To run unit tests, ensure you have test installed:
dart pub add test

Then, run:
dart test


For detailed test output, use:
dart test -r expanded