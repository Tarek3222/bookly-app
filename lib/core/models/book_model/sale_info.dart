import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
	final String? country;
	final String? saleability;
	final bool? isEbook;
  final String? price;
  final String? buyLink;

	const SaleInfo( {this.country, this.saleability, this.isEbook,this.price,this.buyLink});

	factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
				country: json['country'] as String?,
				saleability: json['saleability'] as String?,
				isEbook: json['isEbook'] as bool?,
        price: json['listPrice'] == null ? null : json['listPrice']['amount'].toString(),
        buyLink: json["buyLink"] as String?,
			);

	Map<String, dynamic> toJson() => {
				'country': country,
				'saleability': saleability,
				'isEbook': isEbook,
        'price': price,
        'buyLink': buyLink
			};

	@override
	List<Object?> get props => [country, saleability, isEbook,price,buyLink];
}
