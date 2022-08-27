import 'package:exchange/app/theme/app_style.dart';
import 'package:exchange/exchange/controller/exchange_manual_controller.dart';
import 'package:exchange/exchange/view/widgets/exchange_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExchangeForm extends StatefulWidget {
  const ExchangeForm({Key? key}) : super(key: key);

  @override
  State<ExchangeForm> createState() => _ExchangeFormState();
}

class _ExchangeFormState extends State<ExchangeForm> {
  final _controllerCambio = TextEditingController();
  final _controllerValue = TextEditingController();
  var _result = 0.0;
  var _resulTaxCharged = 0.0;
  var _resultTaxOperation = 0.0;
  final _resultTaxWise = 0.0;
  final moneyFormat = NumberFormat('#,##0.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    final _controller = ExchangeManuelController();
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(31, 31, 31, 1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExchanceFormField(
                  hintText: 'Cambio',
                  controller: _controllerCambio,
                ),
                const SizedBox(height: 5),
                ExchanceFormField(
                  hintText: 'Valor a converter USD',
                  controller: _controllerValue,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 18, right: 18),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Imposto (14%): ${moneyFormat.format(_resulTaxCharged)} kz',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Taxa carregar: ${moneyFormat.format(_resultTaxOperation)} kz',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Taxa Wise: ${moneyFormat.format(_resultTaxWise)} kz',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Resultado: ${moneyFormat.format(_result)} kz',
                  style: AppStyle.textPrimary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // ? Button to convert currency
          ElevatedButton(
            onPressed: () {
              _result = _controller.getFinalResult(
                value: _controllerValue.text,
                cambio: _controllerCambio.text,
              );
              _resulTaxCharged = _controller.percentTaxChargedCard;
              _resultTaxOperation = _controller.percentTaxOperationCard;
              setState(() {});
            },
            style: AppStyle.primaryButton,
            child: const Text('Converter'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
