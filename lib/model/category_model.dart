import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
        name: 'Beer',
        imageUrl:
            'https://media.istockphoto.com/photos/cheers-picture-id475500992?b=1&k=20&m=475500992&s=170667a&w=0&h=6qdnWAUz0OYN9sonDqxaXBcMOm2eRkd86ros2OTSThA='),
    Category(
        name: 'Indian Food',
        imageUrl:
            'https://media.istockphoto.com/photos/table-top-view-of-indian-food-picture-id1212329362?b=1&k=20&m=1212329362&s=170667a&w=0&h=hIJRzsC-B1IfoghcbdxbNfKL-f9ma_4Z-JWzs1JU8gE='),
    Category(
        name: 'Cider',
        imageUrl:
            'https://media.istockphoto.com/photos/apple-cider-with-cinnamon-sticks-picture-id1180561783?b=1&k=20&m=1180561783&s=170667a&w=0&h=ezrHxd2T-smbMZRa9nsF-lzAlLnhieh5EwtvnDsdGAo='),
    Category(
        name: 'Mexican Food',
        imageUrl:
            'https://media.istockphoto.com/photos/mexican-dip-sauces-guacamole-cheedar-dip-tomato-salsa-and-pico-de-picture-id1316454127?b=1&k=20&m=1316454127&s=170667a&w=0&h=MR1gvNMpFqSnacjSFcOQtm2XGjFsJE8gdkzbz-0tgfM='),
    Category(
        name: 'Wine',
        imageUrl:
            'https://media.istockphoto.com/photos/close-up-of-young-couple-toasting-with-glasses-of-red-wine-at-picture-id1184016689?k=20&m=1184016689&s=612x612&w=0&h=LurL6PKxIQpMFruzsRovL__GEOajw8Afn77uDmXn7GM='),
    Category(
        name: 'Italian Food',
        imageUrl:
            'https://media.istockphoto.com/photos/italian-cuisine-italian-food-picture-id1181973834?b=1&k=20&m=1181973834&s=170667a&w=0&h=rvdsgb38rVgri9lP3133x4A-WkxJExUFHJcJCoqGb18='),
    Category(
        name: 'Spirit',
        imageUrl:
            'https://images.unsplash.com/photo-1605760291099-f75d92e645fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3Bpcml0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    Category(
        name: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1593069052287-e0e2ada56fce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHw1ODEzMzk0MXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
    Category(
        name: 'Smoothies',
        imageUrl:
            'https://media.istockphoto.com/photos/berry-fruit-cocktails-smoothies-and-milkshakes-fresh-fruit-and-on-picture-id1147899614?k=20&m=1147899614&s=612x612&w=0&h=YTKzxt6mWArsqdNqmzNjuBFAf5gPZ0nzL3HBsshLLm4='),
    Category(
        name: 'Juices',
        imageUrl:
            'https://media.istockphoto.com/photos/fruit-juice-picture-id155376375?b=1&k=20&m=155376375&s=170667a&w=0&h=KL3cT2jGl9IR6pe9ONF2jgp4ra1E02U3avVm8NIpNm4='),
  ];
}
