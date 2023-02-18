import 'package:plants/utils/magic_string.dart';

class Plants {
  late String imgUrl;
  late String name;
  late String tag;
  late int cost;
  late double ratings;
  late int reviews;
  late String description;
  bool? saved;
  late List<String> plantInformation;
  late List<String> customerReviews;

  Plants({
    required this.imgUrl,
    required this.name,
    required this.tag,
    required this.cost,
    required this.ratings,
    required this.reviews,
    required this.description,
    required this.saved,
    required this.plantInformation,
    required this.customerReviews,
  });

  Plants.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    name = json['name'];
    tag = json['tag'];
    cost = json['cost'];
    ratings = json['ratings'];
    reviews = json['reviews'];
    description = json['description'];
    saved = json['false'];
    plantInformation = json['plantInformation'];
    customerReviews = json['customerReviews'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['name'] = name;
    data['tag'] = tag;
    data['cost'] = cost;
    data['ratings'] = ratings;
    data['reviews'] = reviews;
    data['description'] = description;
    data['false'] = false;
    data['plantInformation'] = plantInformation;
    data['customerReviews'] = customerReviews;
    return data;
  }
}

final monsteraDeliciosa = Plants(
  imgUrl: ImageNames.monsteraDeliciosa,
  name: 'Monstera Deliciosa',
  tag: 'Indoor',
  cost: 99,
  ratings: 4.9,
  reviews: 112,
  description:
      'Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama. It has been introduced to many tropical areas, and has become a mildly invasive species in Hawaii, Seychelles, Ascension Island and the Society Islands. It is very widely grown in temperate zones as a houseplant.',
  saved: null,
  plantInformation: ['Outdoor', 'Orchid', 'Medium', '16.9"', '92%'],
  customerReviews: [
    'Good',
    'Best Purchase',
    'Not Great',
  ],
);

final banana = Plants(
  imgUrl: ImageNames.banana,
  name: 'Banana',
  tag: 'Outdoor',
  cost: 99,
  ratings: 4.9,
  reviews: 112,
  description: 'Banana, typical bears plantains, ripe or cooking banana.',
  saved: null,
  plantInformation: ['Outdoor', 'Orchid', 'Medium', '16.9"', '92%'],
  customerReviews: [
    'Good',
    'Best Purchase',
    'Not Great',
  ],
);

final cactus = Plants(
  imgUrl: ImageNames.cactus,
  name: 'Cactus',
  tag: 'Indoor',
  cost: 99,
  ratings: 4.9,
  reviews: 112,
  description: 'Cactus, Normally for looking good.',
  saved: null,
  plantInformation: ['Outdoor', 'Orchid', 'Medium', '16.9"', '92%'],
  customerReviews: [
    'Good',
    'Best Purchase',
    'Not Great',
  ],
);

final flora = Plants(
  imgUrl: ImageNames.flora,
  name: 'Flora',
  tag: 'Other',
  cost: 99,
  ratings: 4.9,
  reviews: 112,
  description: 'Flora, Normally for looking good.',
  saved: null,
  plantInformation: ['Outdoor', 'Orchid', 'Medium', '16.9"', '92%'],
  customerReviews: [
    'Good',
    'Best Purchase',
    'Not Great',
  ],
);

final uzwil = Plants(
  imgUrl: ImageNames.uzwil,
  name: 'Uzwil',
  tag: 'Other',
  cost: 99,
  ratings: 4.9,
  reviews: 112,
  description: 'Uzwil, Normally for looking good.',
  saved: null,
  plantInformation: ['Outdoor', 'Orchid', 'Medium', '16.9"', '92%'],
  customerReviews: [
    'Good',
    'Best Purchase',
    'Not Great',
  ],
);

List<Plants> plantsList = [
  monsteraDeliciosa,
  banana,
  cactus,
  flora,
  monsteraDeliciosa,
  uzwil
];
