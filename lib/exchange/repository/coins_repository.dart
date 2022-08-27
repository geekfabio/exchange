import 'package:exchange/exchange/model/coin_model.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class CoinsRepository {
  final _url = Uri.parse('https://www.bancobai.ao/pt/cambios-e-valores');
  Future<CoinModel> getWebSiteData() async {
    try {
      final response = await http.get(_url);
      final html = dom.Document.html(response.body);
      final coinBuyValue = html
          .getElementsByTagName(
            'tbody > tr > td',
          )
          .map((e) => e.innerHtml.trim())
          .toList()
        ..removeWhere((element) => element.length > 9);

      return CoinModel(
        name: 'Dollar',
        shortName: 'USD',
        value: coinBuyValue[48],
      );
    } catch (_) {
      return CoinModel(
        name: 'Dollar',
        shortName: 'USD',
        value: '0',
      );
    }
  }
}
