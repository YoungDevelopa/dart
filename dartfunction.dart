import 'dart:math';

// Entry point
void main() {
  List<double> cartItems = [5.0, 12.5, 8.0, 20.0, 15.0];

  // Step 1: Filter Items (Anonymous Function)
  List<double> filteredItems = cartItems.where((item) => item >= 10).toList();
  print("Filtered Items (≥ \$10): $filteredItems");

  // Step 2: Apply Discount (Higher-Order Function)
  List<double> discountedItems = applyDiscount(filteredItems, 0.2); // 20% discount
  print("After 20% Discount: $discountedItems");

  // Step 3: Calculate Total with Optional Tax
  double total = calculateTotal(discountedItems, taxRate: 0.08); // 8% tax
  print("Total with Tax: \$${total.toStringAsFixed(2)}");

  // Step 4: Factorial Discount
  double finalTotal = applyFactorialDiscount(total, discountedItems.length);
  print("Final Price after Factorial Discount: \$${finalTotal.toStringAsFixed(2)}");
}

// Higher-Order Function: Apply Discount
List<double> applyDiscount(List<double> items, double discountRate) {
  return items.map((price) => price * (1 - discountRate)).toList();
}

// Calculate Total with Optional Tax
double calculateTotal(List<double> items, {double taxRate = 0.0}) {
  double subtotal = items.reduce((a, b) => a + b);
  return subtotal * (1 + taxRate);
}

// Recursive Function: Factorial
int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);

// Apply Factorial-Based Discount
double applyFactorialDiscount(double total, int itemCount) {
  int fact = factorial(itemCount);
  double discountRate = min(fact / 100, 0.5); // Cap discount at 50%
  print("Factorial Discount Rate: ${discountRate * 100}%");
  return total * (1 - discountRate);
}
