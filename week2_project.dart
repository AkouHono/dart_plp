// Online Shopping Cart System in Dart

// Recursive factorial function
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

// Higher-order function for discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFn) {
  return prices.map(discountFn).toList();
}

// Function to calculate total with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = prices.reduce((a, b) => a + b);
  return total + (total * taxRate);
}

void main() {
  // Shopping cart with prices
  List<double> cart = [5, 15, 8, 20, 30, 50, 7, 10];

  print("Original cart: $cart");

  // Step 1: Filter items >= $10 using anonymous function
  List<double> filteredCart = cart.where((price) => price >= 10).toList();
  print("Filtered cart (>= \$10): $filteredCart");

  // Step 2: Apply 10% discount using higher-order function
  List<double> discountedCart = applyDiscount(filteredCart, (price) => price * 0.9);
  print("After 10% discount: $discountedCart");

  // Step 3: Calculate total with optional 5% tax
  double total = calculateTotal(discountedCart, taxRate: 0.05);
  print("Total with 5% tax: \$${total.toStringAsFixed(2)}");

  // Step 4: Factorial discount based on item count
  int itemCount = discountedCart.length;
  int fact = factorial(itemCount);
  double factorialDiscount = total - (total * (1 / fact));
  print("Total after factorial discount ($itemCount!): \$${factorialDiscount.toStringAsFixed(2)}");

  // Step 5: Display final price
  print("\n Final Price to Pay: \$${factorialDiscount.toStringAsFixed(2)}");
}
