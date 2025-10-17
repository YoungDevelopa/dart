// 🔒 Encapsulation
class BankAccount {
  String _accountHolder; // private variable
  double _balance = 0.0;

  BankAccount(this._accountHolder);

  // Getter
  double get balance => _balance;

  // Setter with validation
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)}");
    } else {
      print("Invalid deposit amount");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew \$${amount.toStringAsFixed(2)}");
    } else {
      print("Invalid withdrawal");
    }
  }

  void displayAccount() {
    print("Account Holder: $_accountHolder");
    print("Balance: \$${_balance.toStringAsFixed(2)}");
  }
}

// 🌳 Inheritance
class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(String holder, this.interestRate) : super(holder);

  void applyInterest() {
    double interest = balance * interestRate;
    deposit(interest);
    print("Interest Applied: \$${interest.toStringAsFixed(2)}");
  }
}

// 🎭 Polymorphism
class Animal {
  void speak() => print("Animal makes a sound");
}

class Dog extends Animal {
  @override
  void speak() => print("Dog barks");
}

class Cat extends Animal {
  @override
  void speak() => print("Cat meows");
}

void makeAnimalSpeak(Animal animal) {
  animal.speak(); // Calls overridden method
}

// 🎨 Abstraction
abstract class Shape {
  void draw(); // abstract method
}

class Circle extends Shape {
  @override
  void draw() => print("Drawing a Circle");
}

class Square extends Shape {
  @override
  void draw() => print("Drawing a Square");
}

// 🧪 Main Function to Test Everything
void main() {
  // Encapsulation
  var account = BankAccount("Alice");
  account.deposit(100);
  account.withdraw(30);
  account.displayAccount();

  // Inheritance
  var savings = SavingsAccount("Bob", 0.05);
  savings.deposit(200);
  savings.applyInterest();
  savings.displayAccount();

  // Polymorphism
  makeAnimalSpeak(Dog());   // Output: Dog barks
  makeAnimalSpeak(Cat());   // Output: Cat meows

  // Abstraction
  Shape shape1 = Circle();
  Shape shape2 = Square();
  shape1.draw(); // Output: Drawing a Circle
  shape2.draw(); // Output: Drawing a Square
}
