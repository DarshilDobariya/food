import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String desc;

  const Product(
      {required this.name,
      required this.desc,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        desc: snap['desc'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    Product(
        name: 'Burritos',
        category: 'Maxican Food',
        imageUrl:
            'https://media.istockphoto.com/photos/mexican-rice-and-chicken-burrito-picture-id1317280854?b=1&k=20&m=1317280854&s=170667a&w=0&h=18aLzU_nZIrxmPxcl0F9gdGDQY-bwq7koNGMaroIlL8=',
        price: 10.99,
        isRecommended: false,
        isPopular: true,
        desc:
            'A Mexican dish consisting of a tortilla rolled round a savoury filling, typically of minced beef or beans.'),
    Product(
        name: 'Brown Ale',
        category: 'Beer',
        imageUrl:
            'https://media.istockphoto.com/photos/six-pack-of-beer-in-ice-bucket-picture-id586694708?k=20&m=586694708&s=612x612&w=0&h=rgQyYBu0rkGCiN9W0OmCol2_srSxB9TBVWZ2WTM6vd4=',
        price: 9.99,
        isRecommended: true,
        isPopular: false,
        desc:
            'Brown ale is a style of beer with a dark amber or brown colour. Beers termed brown ale include sweet, low alcohol beers such as Manns Original Brown Ale, medium strength amber beers of moderate bitterness such as Newcastle Brown Ale, and malty but hoppy beers such as Sierra Nevada Brown Ale'),
    Product(
        name: 'Pale Ale',
        category: 'Beer',
        imageUrl:
            'https://media.istockphoto.com/photos/refreshing-summer-pint-of-beer-picture-id517501476?k=20&m=517501476&s=612x612&w=0&h=_NjOEsa3D91o3CEDyMydgDmq9UaJDSHgtLbZlMKbASc=',
        price: 7.49,
        isRecommended: true,
        isPopular: false,
        desc:
            "Pale ale is a popular style of beer that's hop-forward with a malty flavor, a golden to amber color, and moderate strength. Brewed with pale malt and ale yeast, pale ales bridge the gap between dark stouts and light lagers. They are full of flavor, but not too heavy, so the style is very approachable"),
    Product(
        name: 'South Indian',
        category: 'Indian Food',
        imageUrl:
            'https://media.istockphoto.com/photos/assorted-south-indian-breakfast-foods-on-wooden-background-ghee-dosa-picture-id1292563627?b=1&k=20&m=1292563627&s=170667a&w=0&h=4DxcYQ2CACloQiFhgWW620pAvY859OhzyOEdAT8PbCY=',
        price: 19.99,
        isRecommended: true,
        isPopular: true,
        desc:
            "A dosa is a thin pancake originating from South India, made from a fermented batter predominantly consisting of lentils and rice.a dosa-like dish made by cooking ingredients in a batter. Unlike a dosa, which is crisp and crepe-like, uttapam is a thick pancake, with toppings cooked right into the batter. Uttapam is sometimes characterized as an Indian pizza"),
    Product(
        name: 'Stout',
        category: 'Beer',
        imageUrl:
            'https://images.unsplash.com/photo-1594170342649-2141cbe17478?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHN0b3V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        price: 16.49,
        isRecommended: false,
        isPopular: true,
        desc:
            "stout, dark, heavy-bodied beer popular in Great Britain and Ireland. Stouts are stronger versions of mild ale"),
    Product(
        name: 'Tacos',
        category: "Mexican Food",
        imageUrl:
            'https://media.istockphoto.com/photos/serving-of-tacos-with-shredded-roast-pork-and-cheese-filling-on-brown-picture-id1296272943?b=1&k=20&m=1296272943&s=170667a&w=0&h=jvmeUiwn1nuXHhzYGDyNOqbnFbo46WYQDzopZssKvec=',
        price: 19.99,
        isRecommended: true,
        isPopular: false,
        desc:
            'A crispy or soft corn or wheat tortilla that is folded or rolled and stuffed with a mixture'),
    Product(
        name: 'White Wine',
        category: 'Wine',
        imageUrl:
            'https://media.istockphoto.com/photos/white-wine-with-grapes-on-old-wooden-table-picture-id505822694?k=20&m=505822694&s=612x612&w=0&h=-bdYWeTtGvqLz8xk4vJMx2O7g7ZA57zxsGgRueNGI0c=',
        price: 89.99,
        isRecommended: false,
        isPopular: true,
        desc:
            "White wine is a wine that is fermented without skin contact. The colour can be straw-yellow, yellow-green, or yellow-gold. It is produced by the alcoholic fermentation of the non-coloured pulp of grapes, which may have a skin of any colour. ... Among the many types of white wine, dry white wine is the most common."),
    Product(
        name: 'Red Wine',
        category: 'Wine',
        imageUrl:
            'https://media.istockphoto.com/photos/wine-tasting-at-restaurant-picture-id476976729?k=20&m=476976729&s=612x612&w=0&h=5ioxIi1WAChfSxP_0S-WZjbgH6J3pUU2wBLjnca_i7o=',
        price: 99.99,
        isRecommended: true,
        isPopular: true,
        desc:
            'Red wine is made with dark-skinned rather than light-skinned grapes. During red wine production, the winemaker allows pressed grape juice, called must, to macerate and ferment with the dark grape skins, which adds color, flavor and tannin to the wine.'),
    Product(
        name: 'Rose Wine',
        category: 'Wine',
        imageUrl:
            'https://media.istockphoto.com/photos/rose-wine-alfresco-picture-id157619922?k=20&m=157619922&s=612x612&w=0&h=wGxIgpZMKJZIi4luF6wPrnrloT3LnwmNzFbS58mDyNs=',
        price: 92.49,
        isRecommended: true,
        isPopular: true,
        desc:
            "Rosé is a type of wine made from red wine grapes, produced in a similar manner to red wine, but with reduced time fermenting with grape skins. This reduced skin contact gives rosé a pink hue and lighter flavor than that of red wine"),
    Product(
        name: 'Lasagna',
        category: 'Italian Food',
        imageUrl:
            'https://media.istockphoto.com/photos/italian-lasagna-with-tomato-sauce-and-cheese-served-with-tomatoes-and-picture-id1303741768?b=1&k=20&m=1303741768&s=170667a&w=0&h=bYqQ1wFATGu6eWxrkX28t75ma5L_0YKVfpIAQZPHEN8=',
        price: 39.99,
        isRecommended: false,
        isPopular: true,
        desc:
            'Lasagna is a wide, flat sheet of pasta. Lasagna can refer to either the type of noodle or to the typical lasagna dish which is a dish made with several layers of lasagna sheets with sauce and other ingredients, such as meats and cheese, in between the lasagna noodles.'),
    Product(
        name: 'Neapolitan Pizza',
        category: 'Italian Food',
        imageUrl:
            'https://media.istockphoto.com/photos/pizza-margherita-picture-id157741539?b=1&k=20&m=157741539&s=170667a&w=0&h=2Mz1I9PkpcPaP8kG_HxrNKIe1oqCmfmcWbRVDw6s5XM=',
        price: 29.99,
        isRecommended: true,
        isPopular: true,
        desc:
            'Neapolitan pizza, or pizza Napoletana, is a type of pizza that originated in Naples, Italy. This style of pizza is prepared with simple and fresh ingredients: a basic dough, raw tomatoes, fresh mozzarella cheese, fresh basil, and olive oil. No fancy toppings are allowed!'),
  ];
}
