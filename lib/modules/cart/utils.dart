class Utils {
  static String get imagesPath {
    return 'assets/images/';
  }

  static String get orderImagesPath {
    return '${imagesPath}order/';
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
