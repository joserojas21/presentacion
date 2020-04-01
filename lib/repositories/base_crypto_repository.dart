import 'package:trabajo/models/coin_model.dart';

abstract class BaseCryptoRepository{
  Future<List<Coin>>getTopCoins({int page});
}