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

// Create a regular expression to split on any of the delimiters.
  String pattern = delimiters.map((d) => RegExp.escape(d)).join("|");
  RegExp regExp = RegExp(pattern);

  // Split the numbers string using the constructed regex.
  List<String> tokens = numbersPart.split(regExp);

  List<int> nums = [];
  List<int> negatives = [];

  for (String token in tokens) {
    // Skip empty tokens (in case of extra delimiters).
    if (token.trim().isEmpty) continue;

    // Convert the token to an integer.
    int num = int.parse(token.trim());
    if (num < 0) {
      negatives.add(num);
    }
    nums.add(num);
  }

  // If there are any negative numbers, throw an exception listing them.
  if (negatives.isNotEmpty) {
    throw Exception("negative numbers not allowed " + negatives.join(","));
  }

  // Return the sum of the numbers.
  return nums.fold(0, (sum, element) => sum + element);
}