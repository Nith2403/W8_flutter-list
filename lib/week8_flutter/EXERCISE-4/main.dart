
import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: FavoriteCard(),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  
  int? favoriteIdex;

  void handleFavorite(int index) {
    setState(() {
      if (favoriteIdex == index) {
        favoriteIdex = null;
      } else {
        favoriteIdex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {

        bool isFavorite = favoriteIdex == index;

        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: .5, color: Colors.grey),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jokes[index].title,
                      style: TextStyle(
                          color: appColor, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10.0),
                    Text(jokes[index].description),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  handleFavorite(index);
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
