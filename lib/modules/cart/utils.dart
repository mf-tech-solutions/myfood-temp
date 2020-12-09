class Utils {
  static String get orderImagesPath {
    return 'assets/images/order/';
  }

  static String formatCurrency(double value) {
    return 'R\$${value.toStringAsFixed(2)}';
  }

  static String formatOrderId(int orderId) {
    return 'Pedido #${orderId.toString().padLeft(4, '0')}';
  }

  static String formatCardLastDigits(String lastDigits) {
    return '**** $lastDigits';
  }
}
