enum Category {
  adventure("ffff99f7-3f53-4499-9d11-72408395fcdc", "Adventure"),
  action("22c67bdb-fcd7-470c-bd3e-6e5738693588", "Action"),
  fantasy("6de38926-6b67-46ff-b755-95e55f5d4b4e", "Fantasy"),
  comedy("74bbd3b1-32fe-47b3-8af4-6ca1c745e7cd", "Comedy"),
  drama("c1467b46-6656-4d10-a92d-67118f3b36a6", "Drama"),
  horror("40fbca51-9a00-40be-9fa2-381ceb13f3c0", "Horror"),
  suspense("70fd228e-f039-4468-8fc5-e7864d16d2ba", "Suspense"),
  scifi("6125c361-1c29-460b-b12a-dd4f276e9fb4", "Sci-Fi");

  const Category(this.id, this.description);
  final String description;
  final String id;

  String toMap() => id;

  static Category fromMap(String id) {
    switch (id) {
      case "ffff99f7-3f53-4499-9d11-72408395fcdc":
        return Category.adventure;

      case "22c67bdb-fcd7-470c-bd3e-6e5738693588":
        return Category.action;

      case "6de38926-6b67-46ff-b755-95e55f5d4b4e":
        return Category.fantasy;

      case "74bbd3b1-32fe-47b3-8af4-6ca1c745e7cd":
        return Category.comedy;

      case "c1467b46-6656-4d10-a92d-67118f3b36a6":
        return Category.drama;

      case "40fbca51-9a00-40be-9fa2-381ceb13f3c0":
        return Category.horror;

      case "70fd228e-f039-4468-8fc5-e7864d16d2ba":
        return Category.suspense;

      case "6125c361-1c29-460b-b12a-dd4f276e9fb4":
        return Category.scifi;

      default:
        return Category.adventure;
    }
  }
}
