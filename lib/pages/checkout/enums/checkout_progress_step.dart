enum CheckoutProgressStep {
  address,
  payment,
  summary;

  CheckoutProgressStep get nextStep {
    switch (this) {
      case address:
        return payment;
      case payment:
        return summary;
      case summary:
        return summary;
    }
  }

  int get value {
    switch (this) {
      case address:
        return 0;
      case payment:
        return 1;
      case summary:
        return 2;
    }
  }

  String get localizedTitle {
    switch (this) {
      case address:
        return 'Address';
      case payment:
        return 'Payment';
      case summary:
        return 'Summary';
    }
  }

  String get image {
    switch (this) {
      case address:
        return 'assets/images/common/location.png';
      case payment:
        return 'assets/images/common/card.png';
      case summary:
        return 'assets/images/common/summary.png';
    }
  }
}
