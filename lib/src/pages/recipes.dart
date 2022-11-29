import 'package:flutter/material.dart';
import 'package:blueberry/recipe_detail.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20.0),
        const SizedBox(height: 20.0),
        const TextField(
          decoration: InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 20.0),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          primary: false,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          children: <Widget>[
            _buildCard('Cookie mint', '\$3.99', 'assets/images/doner.jpg',
                false, false, context),
            _buildCard('Cookie cream', '\$5.99', 'assets/images/cereal.jpg',
                true, false, context),
            _buildCard('Cookie classic', '\$1.99',
                'assets/images/classic-lasagna.jpg', false, true, context),
            _buildCard('Cookie choco', '\$2.99',
                'assets/images/grilled-chicken-rice.jpg', false, false, context)
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return SizedBox(
        width: 180,
        height: 240,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name)));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? const Icon(Icons.favorite,
                                    color: Color.fromARGB(255, 14, 129, 56))
                                : const Icon(Icons.favorite_border,
                                    color: Color.fromARGB(255, 14, 129, 56))
                          ])),
                  Hero(
                    tag: imgPath,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7.0),
                  Text(price,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 14, 129, 56),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!added) ...[
                          const Icon(Icons.shopping_basket,
                              color: Color.fromARGB(255, 14, 129, 56),
                              size: 12.0),
                          const Text('Add to cart',
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Color.fromARGB(255, 14, 129, 56),
                                  fontSize: 12.0))
                        ],
                        if (added) ...[
                          const Icon(Icons.remove_circle_outline,
                              color: Color.fromARGB(255, 14, 129, 56),
                              size: 12.0),
                          const Text('3',
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Color.fromARGB(255, 14, 129, 56),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0)),
                          const Icon(Icons.add_circle_outline,
                              color: Color.fromARGB(255, 14, 129, 56),
                              size: 12.0),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
