class ExchangeAutomaticController {
  double wiseValue = 0;
  double percentTaxChargedCard = 0;
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
      final resultado =
          double.parse(value) * double.parse(cambio.replaceAll(',', '.'));
      //Carregar
      final comissaoCompra = resultado * 0.02;
      final ivaSobreCompra = comissaoCompra * 0.14;
      percentTaxChargedCard = ivaSobreCompra;
      final resultadoAposCompra = resultado + comissaoCompra + ivaSobreCompra;
      //Compra
      final comissao = resultadoAposCompra * 0.03;
      percentTaxOperationCard = comissao;
      final ivaSobreComissao = comissao * 0.14;
      //Resultado
      final resultadoSobreComissao =
          resultadoAposCompra + comissao + ivaSobreComissao;

      return resultadoSobreComissao;
    } on FormatException {
      return 0;
    }
  }

  // double _getTaxOperationBank(double value) {
  //   return value * _kOperationTaxBank;
  // }

  // double _getTaxBank(double value) {
  //   return value * _kCurrentTaxBank;
  // }

  // double _getTaxIva(double value) {
  //   return value * _kIva;
  // }

  String replaceCharAt(String oldString, int index, String newChar) {
    if (oldString.length > 3) {
      return oldString.substring(0, index) +
          newChar +
          oldString.substring(index + 1);
    }
    return oldString;
  }
}
