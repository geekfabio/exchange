import 'package:flutter/material.dart';

class ExchangeForm extends StatefulWidget {
  const ExchangeForm({Key? key}) : super(key: key);

  @override
  State<ExchangeForm> createState() => _ExchangeFormState();
}

class _ExchangeFormState extends State<ExchangeForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(31, 31, 31, 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(18),
            width: double.maxFinite,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(27, 26, 28, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Moeda',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.currency_exchange_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      '  Dollar',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      ' USD',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(top: 5, left: 18, right: 18),
            width: double.maxFinite,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(27, 26, 28, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Quantidade USD',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(child: const TextField()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(top: 5, left: 18, right: 18),
            width: double.maxFinite,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(27, 26, 28, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Converted Value',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          // ? Button to convert currency
          TextButton(onPressed: () {}, child: const Text('Converter'))
        ],
      ),
    );
  }
}
