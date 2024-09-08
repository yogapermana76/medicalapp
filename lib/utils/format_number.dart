import 'package:intl/intl.dart';

class NumberUtils {
  // Define a static method to format the price with "Rp." prefix
  static String formatPrice(double price) {
    final priceFormatter = NumberFormat('#,###', 'id_ID');
    return 'Rp. ${priceFormatter.format(price)}';
  }
}
