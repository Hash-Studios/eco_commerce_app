import 'package:flutter/material.dart';

class ProductBadges extends StatefulWidget {
  @override
  _ProductBadgesState createState() => _ProductBadgesState();
}

class _ProductBadgesState extends State<ProductBadges> {
  List<Map<String, dynamic>> badgeData = [
    {"text": "30-Day Delivery", "photo": "delivery-time.png"},
    {"text": "Cash on Delivery", "photo": "banknotes--v1.png"},
    {"text": "Contactless Delivery", "photo": "delivery-person.png"},
    {"text": "Free Shipping", "photo": "free-shipping.png"},
    {"text": "Verified Product", "photo": "checkmark.png"},
    {"text": "Eco-freindly", "photo": "tree.png"},
    {"text": "Verified Seller", "photo": "check-male--v1.png"},
    {"text": "6 Months Warranty", "photo": "security-checked.png"},
  ];
  List<int> indexes = [0, 1, 2, 3, 4, 5, 6, 7];
  int nextInd() {
    indexes.shuffle();
    int index = indexes[0];
    indexes.removeAt(0);
    return index;
  }

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      nextInd();
    }
    print(indexes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/${badgeData[indexes[index]]["photo"]}",
                  width: 50,
                  color: Colors.white24,
                  colorBlendMode: BlendMode.lighten,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    badgeData[indexes[index]]["text"],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                )
              ],
            ),
          );
        });
  }
}
