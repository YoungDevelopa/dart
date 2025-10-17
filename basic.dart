void main() {
  // 1. Define Variables
  int age = 25;
  double height = 5.9;
  String name = "Developer";
  bool isStudent = true;
  List<int> scores = [85, 90, 78];

  print("Age: $age");
  print("Height: $height");
  print("Name: $name");
  print("Is Student: $isStudent");
  print("Scores: $scores");

  // 2. Type Conversion
  print(stringToInt("42"));
  print(stringToDouble("3.14"));
  print(intToString(100));
  print(intToDouble(100));

  // 3. Conversion Function
  convertAndDisplay("123");

  // 4. Control Flow
  checkNumberSign(-5);
  checkVotingEligibility(17);
  printDayOfWeek(3);
  printForLoop();
  printWhileLoop();
  printDoWhileLoop();

  // 5. Combine Data & Control Flow
  List<int> numbers = [3, 15, 102, 7, 88];
  processNumbers(numbers);
}

// Type Conversion Functions
int stringToInt(String input) => int.tryParse(input) ?? 0;
double stringToDouble(String input) => double.tryParse(input) ?? 0.0;
String intToString(int input) => input.toString();
double intToDouble(int input) => input.toDouble();

// Conversion Function
void convertAndDisplay(String number) {
  int intVal = stringToInt(number);
  double doubleVal = stringToDouble(number);
  print("Converted to int: $intVal");
  print("Converted to double: $doubleVal");
}

// If-Else: Number Sign
void checkNumberSign(int num) {
  if (num > 0) {
    print("$num is positive");
  } else if (num < 0) {
    print("$num is negative");
  } else {
    print("$num is zero");
  }
}

// If-Else: Voting Eligibility
void checkVotingEligibility(int age) {
  if (age >= 18) {
    print("Eligible to vote");
  } else {
    print("Not eligible to vote");
  }
}

// Switch Case: Day of Week
void printDayOfWeek(int day) {
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
  }
}

// Loops
void printForLoop() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}

void printWhileLoop() {
  int i = 10;
  while (i >= 1) {
    print(i);
    i--;
  }
}

void printDoWhileLoop() {
  int i = 1;
  do {
    print(i);
    i++;
  } while (i <= 5);
}

// Combine Data & Control Flow
void processNumbers(List<int> nums) {
  for (int num in nums) {
    print("Number: $num");

    // Even or Odd
    if (num % 2 == 0) {
      print("Even");
    } else {
      print("Odd");
    }

    // Categorize
    switch (num) {
      case <= 10:
        print("Small");
        break;
      case <= 100:
        print("Medium");
        break;
      default:
        print("Large");
    }
  }
}
