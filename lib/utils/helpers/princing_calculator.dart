class JPricingCalculator {
  //CALCULATE PRICE BASED ON TAX AND SHIPPING
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice +
        // taxAmount +
        shippingCost;

    return totalPrice;
  }

  /// CALCULATE SHIPPING COST
  ///
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

//CALCULATE TAXT
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice + taxRate;
    return taxAmount.toStringAsFixed(2);
  }

//CALCULATE TAX EVEN THE WORLD LOCATION
  static double getTaxRateForLocation(String location) {
    //lookUp the tax rate for the given location from a tax rate database or API
    //return the appropiate txt rate
    return 0.10; //tax rate of 10%
  }

  static double getShippingCost(String location) {
    //lookUp the shipping cost fro the givenLocation using a shipping rate API.
    //calculate the shipping cost based on various factors like distance, weight, etc.
    return 5.00; //example shipping cost of $5
  }

  /// SUM ALL CART VALUES AND RETURN TOTAL AMOUNT
  //static double calculateCartTotal(CartModel cart){
  //return cart.item.map((e) => e.price).fold(0,(previousPrice,currentPrice)=> previousPrice+(currentPrice ??0))};
}
