import 'package:flutter/material.dart';

class ExchangeTabs extends StatefulWidget {
  const ExchangeTabs({Key? key}) : super(key: key);

  @override
  State<ExchangeTabs> createState() => _ExchangeTabsState();
}

class _ExchangeTabsState extends State<ExchangeTabs> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() {
          _selectedTab = _selectedTab == 0 ? 1 : 0;
        }),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(31, 31, 31, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _tabButtom('Manual', _selectedTab == 0 ? true : false),
              _tabButtom('Automático', _selectedTab != 0 ? true : false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabButtom(String text, bool selected) {
    return Flexible(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromRGBO(47, 46, 52, 1)
              : const Color.fromRGBO(31, 31, 31, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
