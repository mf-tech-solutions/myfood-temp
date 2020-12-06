class Utils {
  static String get orderImagesPath {
    return 'assets/images/order/';
  }

  static String formatCurrency(double value) {
    return 'R\$${value.toStringAsFixed(2)}';
  }
}
