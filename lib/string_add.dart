class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Check for mixed input (letters + numbers)
    if (RegExp(r'[a-zA-Z]').hasMatch(numbers)) {
      throw Exception("Invalid input: Mixed characters and numbers are not allowed.");
    }

    // Custom delimiter support
    String delimiter = ',|\n';
    if (numbers.startsWith("//")) {
      final parts = numbers.split('\n');
      delimiter = (RegExp.escape(parts[0].substring(2))); // Extract delimiter
      numbers = parts[1]; // Actual number string
    }

    // Split numbers using the delimiter
    final numList = numbers.split(RegExp(delimiter)).map(int.parse);

    // Check for negatives
    final negatives = numList.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("Negative numbers not allowed: ${negatives.join(', ')}");
    }

    return numList.reduce((a, b) => a + b);
  }
}