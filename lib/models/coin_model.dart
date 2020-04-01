import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String name;
  final String fullName;
  final double price;

  const Coin({
    @required this.name,
    @required this.fullName,
    @required this.price,
    //@required this.slug,
    //@required this.percent_change_1h,
  });

  @override
  List<Object> get props => [
    name,
    fullName,
    price,
    //slug,
    //percent_change_1h,
  ];

  @override
  String toString() =>
      'Coin { name: $name, fullName: $fullName, price: $price }';
  //'Coin { name: $name, $fullName, price: $price, slug: $slug, percent_change_1h}';

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'] as String,
      fullName: json['CoinInfo']['FullName'] as String,
      price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
    );
  }
}
