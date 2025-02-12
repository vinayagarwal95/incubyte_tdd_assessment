
class StringCalculator {
  final List<String> _defaultDelimiters = [",", "\n"];

  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Extract custom delimiter if present
    final delimiters = List<String>.from(_defaultDelimiters);
    String processedNumbers = numbers;

    if (numbers.startsWith("//")) {
      final parts = numbers.split("\n");
      if (parts.length > 1) {
        final customDelimiter = parts[0].substring(2);
        delimiters.add(RegExp.escape(customDelimiter));
        processedNumbers = parts.sublist(1).join("\n"); // Remove delimiter declaration
      }
    }

    // Convert numbers string into a list of integers
    final numList = _parseNumbers(processedNumbers, delimiters);

    // Validate negative numbers
    _validateNegatives(numList);

    return numList.fold(0, (sum, num) => sum + num);
  }

  List<int> _parseNumbers(String input, List<String> delimiters) {
    final delimiterPattern = delimiters.join("|");
    return input.split(RegExp(delimiterPattern)).map((e) => int.tryParse(e) ?? 0).toList();
  }

  void _validateNegatives(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("Negative numbers not allowed: ${negatives.join(', ')}");
    }
  }
}
