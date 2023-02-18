class CategoryWidget {
  String name;
  String tag;

  CategoryWidget({
    required this.name,
    required this.tag,
  });
}

final all = CategoryWidget(name: "All", tag: 'All');

final indoor = CategoryWidget(name: "Indoor", tag: "Indoor");

final outdoor = CategoryWidget(name: "Outdoor", tag: "Outdoor");

final other = CategoryWidget(name: "Other", tag: "Other");

List categoriesList = [all, indoor, outdoor, other];
