
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/model/bottom_navy_bar_item.dart';
import '../src/model/product.dart';
import '../src/model/product_category.dart';
import '../src/model/recommended_product.dart';

List firscategory = [
  "Fish 1",
  "Fish 2",
  "Fish 3",
  "Fish 4",
  "Fish 5",
  "Fish 6",
];
class Model {
  final int id;
  final String imagePath;
  final String name;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0, imagePath: 'assets/icon/home.png', name: 'Home'),
  Model(id: 1, imagePath: 'assets/icon/search.png', name: 'Search'),
  Model(id: 2, imagePath: 'assets/icon/heart.png', name: 'Like'),
  Model(id: 3, imagePath: 'assets/icon/notification.png', name: 'notification'),
  Model(id: 4, imagePath: 'assets/icon/user.png', name: 'Profile'),
];

class AppData {
  const AppData._();

  static List<Product> products = [
    Product(
        name: 'NAGARAI நகரை மீன்',
        price: 230,
        about:
            """குழம்பு, வறுவல் என இரண்டிற்கும் சுவையை தரும் நகரை மீன் எல்லா காலக்கட்டத்திலும் எளிதில் கிடைக்கக் கூடிய மீன்களில் ஒன்று.\nநகரை மீன்களிலும் இரண்டு மூன்று ரகம் உள்ளது.\nMadeIn : chennai""",
        isAvailable: true,
        off:  150,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/5442-2022-03-25.jpg',
          'https://ecfisher.com/admin/upload/images/5442-2022-03-25.jpg',
          'https://ecfisher.com/admin/upload/images/5442-2022-03-25.jpg',
        ],
        isLiked: true,
        rating: 1,
        type: ProductType.seeFish),
    Product(
        name: 'SQUID / KANAVAI கனவா மீன்',
        price: 380.0,
        about:"""Squid contains a high number of vitamins and minerals, including Vitamin B-12, potassium, iron, phosphorus and copper.
\nThese essential nutrients aid in the performance and health of blood cells, bones and the immune system.
\nMadeIn : chennai""",
          isAvailable: false,
        off: 220,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/7742-2022-03-25.jpg',
          'https://ecfisher.com/admin/upload/images/7742-2022-03-25.jpg',
          
        ],
        isLiked: false,
        rating: 4,
        type: ProductType.seeFish),
    Product(
        name: 'PAARAI (7-10 fishes) பாரை மீன்',
        price:  380.00,
        about:
          """பாரை மீன் ஒரு மென்மையான சுவை உடையது.
\nஇது உலகின் அனைத்து கடல் உணவு பிரியர்களையும் கவர்ந்திழுக்கும் சுவை கொண்டது.
\nபாரை மீனின் சதை இளஞ்சிவப்பு நிறத்தில் இருக்கும். பாரை மீனில் கொழுப்பின் அளவும் குறைவாகவே இருக்கும் மேலும் சமைக்கும் போதே வாசனை மிகுந்து காணப்படும்.  
\nபாரை மீனில் ஒமேகா3, புரதம், வைட்டமின் டி, வைட்டமின் ஏ, சொடியம் மற்றும் பொட்டாசியம் போன்ற சத்துக்கள் நிறைந்துள்ளது. மேலும் ஆரோக்கியமான கொழுப்பு அமிலங்கள் உள்ளன.
\nஉடல் எடையை குறைக்க நினைப்பவர்கள் பாரை மீனை விரும்பி உண்ணலாம். மேலும் உடலில் கொழுப்பின் அளவை சமநிலைப்படுத்தவும், நீரிழிவு நோயைத் தடுக்கவும், உடலின் வலிமையை உறுதிசெய்து ஆரோக்கியத்தை மேம்படுத்தவும், எலும்புகளை வலுப்படுத்தவும் பாரை மீன் உதவுகிறது. 
\nMadeIn : chennai""", isAvailable: true,
        off: 300.00,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/other_images/1648030002.1879-855.jpg',
        'https://ecfisher.com/admin/upload/other_images/1648030002.1879-855.jpg',
         
        ],
        isLiked: false,
        rating: 3,
        type: ProductType.tablet),
    Product(
        name: 'CRAB நண்டு (Medium ~10 Qty.)',
        price: 400,
        about:
         """Crab is packed with protein, which is important for building and maintaining muscle.
\nCrab also contains high levels of omega-3 fatty acids, vitamin B12, and selenium.Read More""", isAvailable: true,
        off:300.00,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/3216-2022-04-07.jpg',
          'https://ecfisher.com/admin/upload/images/3216-2022-04-07.jpg',

        ],
        isLiked: false,
        rating: 5,
        
        type: ProductType.seeFish),
    Product(
        name: 'SANKARA BIG சங்கரா மீன்',
        price: 330,
        about:
        """இளஞ்சிவப்பு நிறத்தினில் காணப்படும் சங்கரா மீன் அனைவரும் வாங்கக்கூடிய விலையில் கிடைக்கிறது.
\nவிளையாட்டு வீரர்களுக்கு தேவைப்படும் புரோட்டீன் சத்து சங்கராவில் அதிக அளவு கிடைக்கிறது.
\nமேலும் சங்கரா மீன் எடை குறைப்பிற்கும், தசைகளை வலுவாக்கவும் உதவுகிறது.
\nசங்கரா மீன்களில் இரண்டு ரகங்கள் உள்ளன. 
\nஇதில் வைட்டமின் பி12 அதிகம் நிறைந்துள்ளது.
\nஇரத்த அணுக்கள் மற்றும் டி.என்.ஏ வை உற்பத்தி செய்ய உதவுகிறது. நரம்புகளை ஆரோக்கியமாக வைத்திருக்கவும், எலும்புகளை பலப்படுத்தவும், செரோடோனின் என்ற இரசாயனத்தை ஒருங்கிணைக்கவும் உதவுகிறது. 
\nஇதில் உள்ள வைட்டமின் பி12 உடலின் ஆற்றலை அதிகரிக்க வல்லது. பளிச்சென்று """, 
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/7426-2022-04-07.png',
         'https://ecfisher.com/admin/upload/images/7426-2022-04-07.png',
         
        ],
        isLiked: false,
        rating: 4,
        type: ProductType.seeFish),
    Product(
        name: 'KUMARA PARAI குமார பாறை',
        price: 350,
        about:"""Parai fish is rich in vitamin D, proteins, carbohydrates and other essential nutrients.
\nParai fish prevents inflammations and blood clots.
\nParai fish reduces the risk of autoimmune diseases.
\nParai fish reduces the levels of bad cholesterol.
\nPaarai fish reduces risk of heart diseases."""
       , isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/7034-2022-06-27.jpg',
          'https://ecfisher.com/admin/upload/images/7034-2022-06-27.jpg',
          'https://ecfisher.com/admin/upload/images/7034-2022-06-27.jpg',
        ],
        isLiked: false,
        rating: 2,
        type: ProductType.headphone),
    Product(
        name: 'prawan',
        price: 150,
        about:
          """Prawns are a great source of Vitamins B-6, B-12 and Niacin, which help the body produce energy, build muscle and replenish red blood cells.
\nPrawns contain significant amounts of iron, a mineral that is essential for the body to effectively distribute oxygen.""",isAvailable: true,
        off: 100,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/5573-2022-09-17.jpg',
        ],
        isLiked: false,
        rating: 3,
       
        type: ProductType.tv),
    Product(
        name: 'KATLA கட்லா மீன்',
        price: 500,
        about:"""Catla contains low cholesterol levels.
\nIt has a low-fat content. It is rich in numerous nutrients such as zinc, potassium, iodine, vitamins, selenium, and Vitamin A.
\nOmega-3 fatty acids are said to keep our skin healthy and help prevent skin problems such as psoriasis and eczema."""
        ,isAvailable: true,
        off: 400,
        quantity: 0,
        images: [
          'https://ecfisher.com/admin/upload/images/6277-2022-09-17.jpg',
        
        ],
        isLiked: false,
       
        rating: 2,
        type: ProductType.tv),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(ProductType.all, true, Icons.all_inclusive),
    ProductCategory(
        ProductType.mobile, false, FontAwesomeIcons.fish),
    ProductCategory(ProductType.seeFish, false, FontAwesomeIcons.fish),
    ProductCategory(ProductType.tablet, false, FontAwesomeIcons.fish),
    ProductCategory(ProductType.headphone, false, FontAwesomeIcons.fish),
    ProductCategory(ProductType.tv, false, FontAwesomeIcons.fish),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List bottomNavyBarItems = [
    BottomNavyBarItem(
        "Home", const Icon(Icons.home), const Color.fromARGB(255, 2, 116, 30), Colors.grey),
   BottomNavyBarItem(
        "Categoriea", const Icon(Icons.category_sharp), const Color.fromARGB(255, 2, 116, 30), Colors.grey),
    BottomNavyBarItem("Favorite", const Icon(Icons.favorite),
        const Color.fromARGB(255, 2, 116, 30), Colors.grey),
    BottomNavyBarItem("Cart", const Icon(Icons.shopping_cart),
        const Color.fromARGB(255, 2, 116, 30), Colors.grey),
    BottomNavyBarItem("Profile", const Icon(Icons.person),
        const Color.fromARGB(255, 2, 116, 30), Colors.grey),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
        imagePath: "", cardBackgroundColor: const Color.fromARGB(255, 2, 116, 30)),
    RecommendedProduct(
        imagePath: "",
        cardBackgroundColor: const Color(0xFF3081E1),
        buttonBackgroundColor: const Color(0xFF9C46FF),
        buttonTextColor: Colors.white),
  ];
}
