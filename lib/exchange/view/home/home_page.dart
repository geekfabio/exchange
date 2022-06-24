import 'package:exchange/exchange/view/widgets/exchange_form.dart';
import 'package:exchange/exchange/view/widgets/exchange_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Exchange Bai')),
        backgroundColor: const Color.fromRGBO(27, 26, 28, 1),
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(27, 26, 28, 1),
      body: Column(
        children: const [
          //Page Header
          SizedBox(
            height: 48,
          ),
          ExchangeTabs(),
          //Page Form
          ExchangeForm(),
          Spacer()
        ],
      ),
    );
  }
}
