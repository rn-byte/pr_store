class PrPricingCalculator {
  PrPricingCalculator._();

  ///calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  ///calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //calculate Tax

  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //look up the tax rate for the given location from the tax rate database or API
    //return the appropriate tax rate

    return 0.10;
  }

  static double getShippingCost(String location) {
    //look up the tax rate for the given location from the tax rate database or API
    //calculate the shipping rate based on factors like distance, package weight etc
    return 50.00; //example shipping cost of $5
  }

  ///calculate CART total
  ///sum all cart value and return total amound

  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0,
  //       (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
