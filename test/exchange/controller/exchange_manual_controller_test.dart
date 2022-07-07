import 'package:exchange/exchange/controller/exchange_manual_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = ExchangeManuelController();
  const kValue = '100.0';
  const kCambio = '435.0';

  test('When getNoTaxResult is called then return a Double', () {
    //expeted
    final result = controller.getNoTaxResult(value: kValue, cambio: kCambio);
    //action
    expect(43500, result);
    //result
  });

  test('When getNoTaxResult is Invalid format return 0', () {
    final result =
        controller.getNoTaxResult(value: 'Armando', cambio: 'Trindade');
    //result
    expect(
      result,
      0,
    );
  });

  test('When getNoTaxResult is Invalid format return 0', () {
    final result =
        controller.getNoTaxResult(value: 'Armando', cambio: 'Trindade');
    //result
    expect(
      result,
      0,
    );
  });
}
