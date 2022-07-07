class ExchangeManuelController {
  final kIva = 0.14; //Iva(14%) Angola
  final kCurrentTaxBank = 0.05; //Bank Tax (5%)
  double wiseValue = 0;
  double percentTaxChargingCard = 0;
  double percentTaxOperationCard = 0;

  double getNoTaxResult({required String value, required String cambio}) {
    try {
      final _value = double.parse(value);
      final _cambio = double.parse(cambio);
      return _value * _cambio;
    } on FormatException {
      return 0;
    }
  }

  double getFinalResult({required String value, required String cambio}) {
    try {
      final noTaxValue = getNoTaxResult(cambio: cambio, value: value);
      final result =
          noTaxValue + _getTaxBank(noTaxValue) + _getTaxIva(noTaxValue);
      return result;
    } on FormatException {
      return 0;
    }
  }

  double getTotal(String value) {
    return 1;
  }

  double _getTaxBank(double value) {
    return value * kCurrentTaxBank;
  }

  double _getTaxIva(double value) {
    return value * kIva;
  }
}
