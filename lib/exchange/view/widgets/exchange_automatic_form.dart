// ignore_for_file: prefer_const_declarations

import 'package:exchange/app/theme/app_style.dart';
import 'package:exchange/exchange/controller/exchange_automatic_controller.dart';
import 'package:exchange/exchange/model/coin_model.dart';
import 'package:exchange/exchange/repository/coins_repository.dart';
import 'package:exchange/exchange/view/widgets/exchange_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExchangeAutomaticForm extends StatefulWidget {
  const ExchangeAutomaticForm({Key? key}) : super(key: key);

  @override
  State<ExchangeAutomaticForm> createState() => _ExchangeAutomaticFormState();
}

class _ExchangeAutomaticFormState extends State<ExchangeAutomaticForm> {
  bool isLoading = true;
  late Future<CoinModel> getCoinValue;
  @override
  void initState() {
    super.initState();
    getCoinValue = CoinsRepository().getWebSiteData();
  }

  final _controllerValue = TextEditingController();
  String coinValue = '';
  var _result = 0.0;
  var _resulTaxCharged = 0.0;
  var _resultTaxOperation = 0.0;
  final _resultTaxWise = 0.0;

  final moneyFormat = NumberFormat('#,##0.00', 'en_US');
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    final _controller = ExchangeAutomaticController();

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
                FutureBuilder<CoinModel>(
                  future: getCoinValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      coinValue = snapshot.data!.value;
                      return costumText(
                        'Cambio atual: 1Usd =  ${snapshot.data!.value}',
                      );
                    } else if (snapshot.hasError) {
                      return costumText(
                        'Verifique a conexão a internet',
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                ExchanceFormField(
                  controller: _controllerValue,
                  hintText: 'Valor a converter USD',
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
                cambio: coinValue,
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

  Widget costumText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      child: Text(
        text,
        style: AppStyle.textPrimary,
      ),
    );
  }
}
