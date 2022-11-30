import 'package:flutter/material.dart';
import 'package:blueberry/recipe_detail.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: ListView(
        children: [
          const SizedBox(height: 20.0),
          Text(
            'Recettes',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20.0),
          const TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              hintText: 'Enter a product name eg. pension',
              hintStyle: TextStyle(fontSize: 16),
              filled: true,
              labelText: 'Cherchez une recette',
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 20.0),
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                primary: false,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: <Widget>[
                  _buildCard('Le kebab, l\'original', 'Doner Kebab',
                      'assets/images/doner.jpg', false, false, context),
                  _buildCard('Chocolats & fruits', 'Céréales bol',
                      'assets/images/cereal.jpg', false, false, context),
                  _buildCard(
                      'Lasagne italienne',
                      'Lasagne',
                      'assets/images/classic-lasagna.jpg',
                      false,
                      true,
                      context),
                  _buildCard(
                      'Assortiment de légumes',
                      'Salade bol',
                      'assets/images/grilled-chicken-rice.jpg',
                      false,
                      false,
                      context)
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
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
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color.fromARGB(9, 255, 255, 255)),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
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
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(price,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 18.0)),
                  Text(name,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 164, 164, 164),
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 14.0)),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ));
  }
}
