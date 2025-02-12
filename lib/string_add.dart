int add(String numbers) {
  // If the string is empty, return 0.
  if (numbers.isEmpty) {
    return 0;
  }

  // Default delimiters are comma and newline.
  List<String> delimiters = [",", "\n"];
  String numbersPart = numbers;

  // Check if a custom delimiter is specified.
  if (numbers.startsWith("//")) {
    // Find the end of the delimiter definition (first newline).
    int newlineIndex = numbers.indexOf("\n");
    if (newlineIndex != -1) {
      // Extract the delimiter definition.
      String delimiterSpec = numbers.substring(2, newlineIndex);
      
      // If the delimiter is wrapped in square brackets, remove them.
      if (delimiterSpec.startsWith("[") && delimiterSpec.endsWith("]")) {
        delimiterSpec = delimiterSpec.substring(1, delimiterSpec.length - 1);
      }
      
      // Use the specified delimiter.
      delimiters = [delimiterSpec];
      // The rest of the string contains the numbers.
      numbersPart = numbers.substring(newlineIndex + 1);
    }
  }

}