import 'package:exchange/exchange/repository/coins_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = CoinsRepository();

  test('description', () async {
    final result = repository.getWebSiteData();
    expect('actual', result);
  });
}
