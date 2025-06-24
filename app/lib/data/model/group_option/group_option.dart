class GroupOption {
  final int id;
  final String name;
  final List<GroupOptionItem> items;

  GroupOption({required this.id, required this.name, required this.items});
}

class GroupOptionItem {
  final int id;
  final double price;
  final String description;
  final String name;

  GroupOptionItem({
    required this.id,
    required this.price,
    required this.description,
    required this.name,
  });
}
