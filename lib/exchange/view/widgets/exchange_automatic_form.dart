import 'package:exchange/app/theme/app_style.dart';
import 'package:exchange/exchange/view/widgets/exchange_form_field.dart';
import 'package:flutter/material.dart';

class ExchangeAutomaticForm extends StatefulWidget {
  const ExchangeAutomaticForm({Key? key}) : super(key: key);

  @override
  State<ExchangeAutomaticForm> createState() => _ExchangeAutomaticFormState();
}

class _ExchangeAutomaticFormState extends State<ExchangeAutomaticForm> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
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
                Visibility(
                  visible: isLoading,
                  replacement: const CircularProgressIndicator(),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 12),
                    child: Text(
                      'Cambio atual: 1Usd = 435kz',
                      style: AppStyle.textPrimary,
                    ),
                  ),
                ),
                const ExchanceFormField(
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
              children: const [
                Text(
                  'Imposto (14%): ',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Taxa carregar: ',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Taxa Wise: ',
                  style: AppStyle.textBody,
                ),
                Text(
                  'Resultado: ',
                  style: AppStyle.textPrimary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // ? Button to convert currency
          ElevatedButton(
            onPressed: () {
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
