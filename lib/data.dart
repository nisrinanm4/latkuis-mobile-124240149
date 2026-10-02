class User {
  String username;
  String password;
  String name;

  User({required this.username, required this.password, required this.name});
}

User user1 = User(username: "admingacoan", password: "1221", name: "Jokowi");

class Menu {
  int id;
  String name;
  String category;
  String description;
  String price;
  String image;

  Menu({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
  });
}

final List<Menu> menus = [
  Menu(
    id: 1,
    name: "Mie Gacoan",
    category: "Mie",
    price: "12000",
    image: "assets/gacoan.jpg",
    description:
        "Mie pedas dengan pilihan level dan cita rasa khas Gacoan.",
  ),
  Menu(
    id: 2,
    name: "Mie Hompimpa",
    category: "Mie",
    price: "12000",
    image:
        "assets/gacoan.jpg",
    description:
        "Mie dengan cita rasa gurih dan pedas.",
  ),
  Menu(
    id: 3,
    name: "Mie Suit",
    category: "Mie",
    price: "12000",
    image:
        "assets/gacoan.jpg",
    description:
        "Mie dengan cita rasa gurih yang lebih ringan.",
  ),
  Menu(
    id: 4,
    name: "Udang Keju",
    category: "Dimsum",
    price: "12000",
    image:
        "assets/photo.jpg",
    description:
        "Dimsum udang dengan isian keju yang gurih.",
  ),
  Menu(
    id: 5,
    name: "Udang Rambutan",
    category: "Dimsum",
    price: "12000",
    image:
        "assets/rambutan.jpg",
    description:
        "Dimsum udang dengan balutan kulit renyah.",
  ),
  Menu(
    id: 6,
    name: "Pangsit Goreng",
    category: "Dimsum",
    price: "12000",
    image:
        "assets/pangsit.jpg",
    description:
        "Pangsit goreng dengan tekstur renyah dan gurih.",
  ),
  Menu(
    id: 7,
    name: "Es Gobak Sodor",
    category: "Minuman",
    price: "9000",
    image:
        "assets/es gobak.jpg",
    description:
        "Minuman segar dengan rasa manis dan menyegarkan.",
  ),
  Menu(
    id: 8,
    name: "Es Teklek",
    category: "Minuman",
    price: "9000",
    image:
        "assets/es teklek.jpg",
    description:
        "Minuman segar yang cocok dinikmati bersama menu Gacoan.",
  ),
  Menu(
    id: 9,
    name: "Es Tea",
    category: "Minuman",
    price: "6000",
    image:
        "assets/es tea.jpg",
    description:
        "Es teh segar dengan rasa manis dan menyegarkan.",
  ),
];
