import 'dart:io';

// 🔤 String Manipulation
String manipulateString(String input) {
  String concatenated = input + " is awesome!";
  String interpolated = "Length: ${input.length}";
  String substring = input.length >= 3 ? input.substring(0, 3) : input;
  String upper = input.toUpperCase();
  String lower = input.toLowerCase();
  String reversed = input.split('').reversed.join();

  print("Concatenated: $concatenated");
  print("Interpolated: $interpolated");
  print("Substring: $substring");
  print("Uppercase: $upper");
  print("Lowercase: $lower");
  print("Reversed: $reversed");
  print("Length: ${input.length}");

  return "$concatenated | $interpolated | $substring | $upper | $lower | $reversed";
}

// 📊 Collections
void demonstrateCollections() {
  // List
  List<String> fruits = ['apple', 'banana'];
  fruits.add('orange');
  fruits.remove('banana');
  print("List: $fruits");

  // Set
  Set<int> uniqueNumbers = {1, 2, 3, 2};
  uniqueNumbers.add(4);
  uniqueNumbers.remove(1);
  print("Set: $uniqueNumbers");

  // Map
  Map<String, int> scores = {'Alice': 90, 'Bob': 85};
  scores['Charlie'] = 88;
  scores.remove('Bob');
  print("Map: $scores");
}

// 📂 File Handling
void writeToFile(String content, String filename) {
  try {
    File file = File(filename);
    file.writeAsStringSync(content);
    print("Data written to $filename");
  } catch (e) {
    print("Error writing to file: $e");
  }
}

void readFromFile(String filename) {
  try {
    File file = File(filename);
    String contents = file.readAsStringSync();
    print("Contents of $filename:\n$contents");
  } catch (e) {
    print("Error reading file: $e");
  }
}

// ⏳ Date and Time
void demonstrateDateTime() {
  DateTime now = DateTime.now();
  DateTime future = now.add(Duration(days: 5));
  DateTime past = now.subtract(Duration(days: 3));
  Duration difference = future.difference(past);

  print("Now: $now");
  print("Future (+5 days): $future");
  print("Past (-3 days): $past");
  print("Difference between future and past: ${difference.inDays} days");
}

// 🛠️ Combined Utility Application
void runUtilityApp(String userInput) {
  String result = manipulateString(userInput);

  // Store in collection
  List<String> logEntries = [];
  logEntries.add(result);

  // Timestamp
  DateTime timestamp = DateTime.now();
  String log = "[$timestamp] $result";

  // Save to file
  writeToFile(log, 'log.txt');

  // Read back
  readFromFile('log.txt');
}

// 🧪 Main Function
void main() {
  // Test individual modules
  demonstrateCollections();
  demonstrateDateTime();

  // Run combined app
  String userInput = "DartLang";
  runUtilityApp(userInput);
}
