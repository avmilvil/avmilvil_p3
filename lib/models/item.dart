class Item {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String extra;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.extra = '',
  });
}